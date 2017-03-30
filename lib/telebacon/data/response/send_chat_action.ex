defmodule Telebacon.Data.Response.SendChatAction do
  @moduledoc """
  Messaging command parameters to send a chat action, such as:

  * typing
  * upload_photo
  * record_video
  * upload_video
  * record_audio
  * upload_audio
  * upload_document
  * find_location

  Such is documented in the telegram API docs.
  """
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :action
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    action: String.t
  }
end
