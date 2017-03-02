defmodule Telebacon.Data.API.Document do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :thumb,
    :file_name,
    :mime_type,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.Document{
    file_id: String.t,
    thumb: %Telebacon.Data.API.PhotoSize{} | nil,
    file_name: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
end