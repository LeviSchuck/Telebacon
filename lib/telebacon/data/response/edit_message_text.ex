defmodule Telebacon.Data.Response.EditMessageText do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :message_id,
    :inline_message_id,
    :text,
    :parse_mode,
    :disable_web_page_preview,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.EditMessageText{
    chat_id: integer | String.t,
    message_id: integer | nil,
    inline_message_id: String.t | nil,
    text: String.t,
    parse_mode: String.t | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end