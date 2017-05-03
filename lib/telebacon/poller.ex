defmodule Telebacon.Poller do
  @moduledoc false
  use GenServer
  require Logger
  import Telebacon
  alias Telebacon.Poller
  alias Telebacon.Data.Request, as: RQ

  @type config :: [Keyword.t]

  defstruct [
    key: "",
    behaviour: nil,
    payload: nil,
    offset: 0,
    limit: 10,
    timeout: 300,
    delay_count: 0,
    max_delay: 60_000,
  ]
  @type t :: %Poller{}

  @spec start_link(binary, Telebacon.Adapter.t, [Keyword.t]) :: tuple
  def start_link(key, adapter, config) do
    params = {key, adapter, config}
    GenServer.start_link(__MODULE__, params, name: via_tuple(key))
  end

  defp via_tuple(key) do
    {:via, :gproc, {:n, :l, {:telebacon, :poll, key}}}
  end

  @spec whereis(binary) :: pid | nil
  def whereis(key) do
    :gproc.whereis_name({:n, :l, {:telebacon, :poll, key}})
  end

  @spec init({binary, Telebacon.Adapter.t, config}) :: {:ok, Poller.t}
  def init({key, {module, payload}, config}) do
    GenServer.cast(self(), :poll)
    state = %Poller{
      key: key,
      behaviour: module,
      payload: payload,
      limit: Keyword.get(config, :limit, 10),
      timeout: Keyword.get(config, :timeout, 300)
    }
    {:ok, state}
  end

  @spec handle_cast(:poll, Poller.t) :: {:noreply, Poller.t}
  def handle_cast(:poll, state) do
    params = %RQ.GetUpdates{
      offset: state.offset + 1,
      limit: state.limit,
      timeout: state.timeout
    }
    {ty, response} = get_updates(state.key, params)
    nstate = handle_response(ty, response, state)
    {:noreply, nstate}
  end

  @spec handle_info(:poll, Poller.t) :: {:noreply, Poller.t}
  def handle_info(:poll, state) do
    loop_poll()
    {:noreply, state}
  end

  defp loop_poll() do
    GenServer.cast(self(), :poll)
  end
  defp delayed_poll(state) do
    delay = round(calc_delay(state))
    Logger.debug("Delaying due to error #{delay}ms")
    Process.send_after(self(), :poll, delay)
  end
  defp calc_delay(state) do
    x = state.delay_count / 10
    factor = (state.max_delay / (1 + :math.pow(2.71828, -x)))
    factor
  end
  defp reset_delay(state) do
    %{state | delay_count: 0}
  end
  defp inc_delay(state) do
    %{state | delay_count: state.delay_count + 1}
  end
  defp set_offset(state, offset) do
    %{state | offset: offset}
  end

  defp handle_response(:error, response, state) do
    Logger.warn("Got error? #{inspect response}")
    delayed_poll(state)
    state
      |> inc_delay()
  end
  defp handle_response(:ok, response, state) do
    # Logger.debug "Got response #{inspect response}"
    response
      |> Enum.filter(fn update ->
        update.update_id > state.offset
      end)
      |> Enum.map(fn update ->
        params = [state.key, update, state.payload]
        Task.async(state.behaviour, :chat_update, params)
      end)
      |> Enum.each(&Task.await(&1))
    loop_poll()
    noffset = Enum.reduce(response, state.offset, &max(&1.update_id, &2))
    # Logger.debug "Next Offset: #{noffset}"
    state
      |> reset_delay()
      |> set_offset(noffset)
  end
end
