defmodule Telebacon.Data.Response.EditMessageCaption do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :message_id,
    :inline_message_id,
    :caption,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.EditMessageCaption{
    chat_id: integer | String.t,
    message_id: integer | nil,
    inline_message_id: String.t | nil,
    caption: String.t | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end