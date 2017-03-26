defmodule Telebacon.Application do
  @moduledoc """
  Telebacon is a telegram bot for elixir
  """
  require Logger
  use Application

  def start(_type, _args) do
    # Logger.debug "Starting Telebacon"
    Telebacon.Supervisor.start_link()
  end
end
