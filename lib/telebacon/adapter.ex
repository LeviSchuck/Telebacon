defmodule Telebacon.Adapter do
  @moduledoc "Adapter behaviour for a stateless bot"
  @type payload :: term
  @type key :: binary
  @type update :: %Telebacon.Data.API.Update{}
  @type t :: {module, any}
  @callback chat_update(key, update, payload) :: :ok
end
