defmodule Telebacon.Data.Response.SendSticker do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :sticker,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.SendSticker{
    chat_id: integer | String.t,
    sticker: String.t | binary,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end