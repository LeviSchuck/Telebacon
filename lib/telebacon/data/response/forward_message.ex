defmodule Telebacon.Data.Response.ForwardMessage do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :from_chat_id,
    :disable_notification,
    :message_id
  ]
  @type t :: %Telebacon.Data.Response.ForwardMessage{
    chat_id: integer | String.t,
    from_chat_id: integer | String.t,
    disable_notification: boolean | nil,
    message_id: integer
  }
end