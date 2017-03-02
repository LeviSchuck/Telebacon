defmodule Telebacon.Data.Response.SendMessage do
  @moduledoc "Messaging command parameters to send a normal message"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :text,
    :parse_mode,
    :disable_web_page_preview,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup,
  ]
  @type t :: %Telebacon.Data.Response.SendMessage{
    chat_id: integer | String.t,
    text: String.t,
    parse_mode: String.t | nil,
    disable_web_page_preview: boolean | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end
