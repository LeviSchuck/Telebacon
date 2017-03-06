defmodule Telebacon.Poller do
  @moduledoc """
  This is a simple poll-based handler, it will call a given
  behaviour instance of Telebacon.Adapter when it gets updates.
  """
  use GenServer
  require Logger
  alias Telebacon.Data.Request, as: RQ
  alias Telebacon.API, as: API

  @spec start_link(any, binary, atom) :: tuple
  def start_link(state, key, inst) do
    GenServer.start_link(__MODULE__, {state, key, inst}, name: via_tuple(key))
  end

  defp via_tuple(key) do
    {:via, :gproc, {:n, :l, {:telebacon, :poll, key}}}
  end

  @spec whereis(binary) :: pid | nil
  def whereis(key) do
    :gproc.whereis_name({:n, :l, {:telebacon, :poll, key}})
  end

  @spec init({any, binary, atom}) :: {:ok, tuple}
  def init({state, key, inst}) do
    GenServer.cast(self(), :poll)
    {:ok, {state, key, inst, 0}}
  end

  @spec handle_cast(:poll, {any, binary, atom, integer}) :: tuple
  def handle_cast(:poll, {state, key, inst, offset}) do
    params = %RQ.GetUpdates{
      offset: offset + 1,
      limit: 10,
      timeout: 300
    }
    {ty, response} = API.get_updates(key, params)
    noffset = handle_response(ty, response, {state, key, inst, offset})
    {:noreply, {state, key, inst, noffset}}
  end
  defp handle_response(:failure, response, {_, _, _, offset}) do
    Logger.debug "Got error? #{inspect response}"
    GenServer.cast(self(), :poll)
    offset
  end
  defp handle_response(:ok, response, {state, key, inst, noffset}) do
    Logger.debug "Got response #{inspect response}"
    _ = response |> Enum.filter(fn update ->
      update.update_id > offset
    end) |> Enum.map(fn update ->
      Task.async(inst, :chat_update, [update, key, state])
    end) |> Enum.map(&Task.await(&1))
    GenServer.cast(self(), :poll)
    noffset = Enum.reduce(response, offset, &max(&1.update_id, &2))
    Logger.debug "Next Offset: #{noffset}"
    noffset
  end
end
