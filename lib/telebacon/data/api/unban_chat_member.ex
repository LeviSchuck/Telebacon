defmodule Telebacon.Data.API.UnbanChatMember do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %Telebacon.Data.API.UnbanChatMember{
    chat_id: integer | String.t,
    user_id: integer
  }
end