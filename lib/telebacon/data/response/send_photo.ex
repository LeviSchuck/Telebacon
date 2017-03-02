defmodule Telebacon.Data.Response.SendPhoto do
  @moduledoc "Messaging command parameters to send a photo"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :photo,
    :caption,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]

  @type t :: %Telebacon.Data.Response.SendPhoto{
    chat_id: integer | String.t,
    photo: String.t | binary,
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
