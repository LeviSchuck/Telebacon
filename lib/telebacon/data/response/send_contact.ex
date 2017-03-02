defmodule Telebacon.Data.Response.SendContact do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :phone_number,
    :first_name,
    :last_name,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.SendContact{
    chat_id: integer | String.t,
    phone_number: String.t,
    first_name: String.t,
    last_name: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end