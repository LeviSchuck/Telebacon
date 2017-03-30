defmodule Telebacon.Data.Response.SendContact do
  @moduledoc "Messaging command parameters to send a contact"
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
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    phone_number: String.t,
    first_name: String.t,
    last_name: String.t | nil,
    disable_notification: boolean | nil,
    reply_to_message_id: integer | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
