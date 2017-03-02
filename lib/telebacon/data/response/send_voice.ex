defmodule Telebacon.Data.Response.SendVoice do
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
  @type t :: %Telebacon.Data.Response.SendVoice{
    chat_id: integer | String.t,
    voice: String.t | binary,
    duration: integer | nil,
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