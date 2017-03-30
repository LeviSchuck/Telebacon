defmodule Telebacon.Data.Response.SendSticker do
  @moduledoc "Messaging command parameters to send a sticker"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :sticker,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    sticker: String.t | binary,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
