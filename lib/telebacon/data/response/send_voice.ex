defmodule Telebacon.Data.Response.SendVoice do
  @moduledoc "Messaging command parameters to send an voice message"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :voice,
    :duration,
    :caption,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    voice: String.t | binary,
    duration: integer | nil,
    caption: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
