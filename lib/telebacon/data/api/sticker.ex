defmodule Telebacon.Data.API.Sticker do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :thumb,
    :emoji,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.Sticker{
    file_id: String.t,
    width: integer,
    height: integer,
    thumb: %Telebacon.Data.API.PhotoSize{} | nil,
    emoji: String.t | nil,
    file_size: integer | nil
  }
end