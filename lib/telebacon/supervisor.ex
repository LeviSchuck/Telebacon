defmodule Telebacon.Supervisor do
  @moduledoc false
  require Logger
  use Supervisor

  def start_link do
    name = {:via, :gproc, {:n, :l, {:telebacon, :poll_supervisor}}}
    Supervisor.start_link(__MODULE__, [], name: name)
  end

  @spec whereis :: pid | nil
  def whereis do
    :gproc.whereis_name({:n, :l, {:telebacon, :poll_supervisor}})
  end

  def init([]) do
    children = [
      worker(Telebacon.Poller, [], restart: :transient)
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

  @spec add_bot(pid, Telebacon.tel_key, Telebacon.Adapter.t, [Keyword.t])
    :: Supervisor.start_child
  def add_bot(supervisor, key, adapter, config) when is_pid(supervisor) do
    Supervisor.start_child(supervisor, [key, adapter, config])
  end
end
