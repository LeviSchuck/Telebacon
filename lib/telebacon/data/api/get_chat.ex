defmodule Telebacon.Data.API.GetChat do
  @moduledoc "Represents call params for method /getChat"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.API.GetChat{
    chat_id: integer | String.t
  }
end
