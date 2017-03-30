defmodule Telebacon.Data.Response.EditMessageCaption do
  @moduledoc "Messaging command parameters to edit a message caption"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :message_id,
    :inline_message_id,
    :caption,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    message_id: integer | nil,
    inline_message_id: String.t | nil,
    caption: String.t | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
