defmodule Telebacon.Data.Response.EditMessageReplyMarkup do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :message_id,
    :inline_message_id,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.EditMessageReplyMarkup{
    chat_id: integer | String.t,
    message_id: integer | nil,
    inline_message_id: String.t | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end