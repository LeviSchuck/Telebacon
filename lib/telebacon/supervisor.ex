defmodule Telebacon.Supervisor do
  @moduledoc """
  Telebacon application supervisor
  """
  require Logger
  use Supervisor

  @lint false
  def start_link do
    name = {:via, :gproc, {:n, :l, {:telebacon, :poll_supervisor}}}
    Supervisor.start_link(__MODULE__, [], name: name)
  end

  @spec whereis :: pid | nil
  def whereis do
    :gproc.whereis_name({:n, :l, {:telebacon, :poll_supervisor}})
  end

  @lint false
  def init([]) do
    # Logger.debug "Supervising Telebacon"
    children = [
      worker(Telebacon.Poller, [], restart: :transient)
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

  @spec add_bot(pid, any, binary, atom) :: :ok
  def add_bot(supervisor, state, key, inst) when is_pid(supervisor) do
    Supervisor.start_child(supervisor, [state, key, inst])
    :ok
  end
end
