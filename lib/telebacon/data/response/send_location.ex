defmodule Telebacon.Data.Response.SendLocation do
  @moduledoc "Messaging command parameters to send a location"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :lattitude,
    :longitude,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    lattitude: float,
    longitude: float,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
