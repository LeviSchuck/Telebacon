defmodule Telebacon.Adapter do
  @moduledoc "Adapter behaviour for a stateless bot"
  @type state :: any
  @type key :: binary
  @type update :: %Telebacon.Data.API.Update{}
  @callback chat_update(update, key, state) :: :ok
end
