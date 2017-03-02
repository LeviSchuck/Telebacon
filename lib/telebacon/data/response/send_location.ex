defmodule Telebacon.Data.Response.SendLocation do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :lattitude,
    :longitude,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %Telebacon.Data.Response.SendLocation{
    chat_id: integer | String.t,
    lattitude: float,
    longitude: float,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: %Telebacon.Data.Response.ReplyKeyboardMarkup{}
      | %Telebacon.Data.Response.ReplyKeyboardRemove{}
      | %Telebacon.Data.Response.ForceReply{}
      | %{}
      | nil
  }
end