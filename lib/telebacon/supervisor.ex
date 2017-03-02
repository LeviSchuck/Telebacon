defmodule Telebacon.Supervisor do
  @moduledoc """
  Telebacon application supervisor
  """
  require Logger
  use Supervisor

  @lint false
  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  @lint false
  def init([]) do
    Logger.debug "Supervising Telebacon"
    children = [
    ]
    supervise(children, strategy: :one_for_one)
  end
end
