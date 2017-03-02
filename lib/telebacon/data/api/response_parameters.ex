defmodule Telebacon.Data.API.ResponseParameters do
  @derive [Poison.Encoder]
  defstruct [
    :migrate_to_chat_id,
    :retry_after
  ]
  @type t :: %Telebacon.Data.API.ResponseParameters{
    migrate_to_chat_id: integer | nil,
    retry_after: integer | nil
  }
end