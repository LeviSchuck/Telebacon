defmodule Telebacon.Data.Response.EditMessageReplyMarkup do
  @moduledoc "Messaging command parameters to edit markup type on a message"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :message_id,
    :inline_message_id,
    :reply_markup
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    message_id: integer | nil,
    inline_message_id: String.t | nil,
    reply_markup: Telebacon.Data.Response.ReplyMarkup.t
  }
end
