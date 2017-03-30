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
    timeout: 300
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
    noffset = handle_response(ty, response, state)
    {:noreply, %{state | offset: noffset}}
  end

  defp handle_response(:error, _, state) do
    # Logger.debug "Got error? #{inspect response}"
    GenServer.cast(self(), :poll)
    state.offset
  end
  defp handle_response(:ok, response, state) do
    # Logger.debug "Got response #{inspect response}"
    _ = response |> Enum.filter(fn update ->
      update.update_id > state.offset
    end) |> Enum.map(fn update ->
      params = [state.key, update, state.payload]
      Task.async(state.behaviour, :chat_update, params)
    end) |> Enum.map(&Task.await(&1))
    GenServer.cast(self(), :poll)
    noffset = Enum.reduce(response, state.offset, &max(&1.update_id, &2))
    # Logger.debug "Next Offset: #{noffset}"
    noffset
  end
end
