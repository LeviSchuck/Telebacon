defmodule Telebacon.Data.Response.SendDocument do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :document,
    :caption,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.SendDocument{
    chat_id: integer | String.t,
    document: String.t | binary,
    caption: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end