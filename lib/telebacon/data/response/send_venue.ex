defmodule Telebacon.Data.Response.SendVenue do
  @moduledoc "Messaging command parameters to send a venue"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :lattitude,
    :longitude,
    :title,
    :address,
    :foursquare_id,
    :disable_notification,
    :reply_to_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    lattitude: float,
    longitude: float,
    title: String.t,
    address: String.t,
    foursquare_id: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
