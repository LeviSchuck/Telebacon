defmodule Telebacon.Data.Response.SendAudio do
  @moduledoc "Messaging command parameters to send an audio message"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :audio,
    :caption,
    :duration,
    :performer,
    :title,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    audio: String.t | binary,
    caption: String.t | nil,
    duration: integer | nil,
    performer: String.t | nil,
    title: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
