defmodule Telebacon.Data.API.GetChatMember do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %Telebacon.Data.API.GetChatMember{
    chat_id: integer | String.t,
    user_id: integer
  }
end