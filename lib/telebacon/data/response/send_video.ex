defmodule Telebacon.Data.Response.SendVideo do
  @moduledoc "Messaging command parameters to send an video message"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :video,
    :duration,
    :width,
    :height,
    :caption,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    video: String.t | binary,
    duration: integer | nil,
    width: integer | nil,
    height: integer | nil,
    caption: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
