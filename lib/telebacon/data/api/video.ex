defmodule Telebacon.Data.API.Video do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :duration,
    :thumb,
    :mime_type,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.Video{
    file_id: String.t,
    width: integer,
    height: integer,
    duration: integer,
    thumb: %Telebacon.Data.API.PhotoSize{} | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
end