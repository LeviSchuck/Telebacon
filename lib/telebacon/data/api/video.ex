defmodule Telebacon.Data.API.Video do
  @moduledoc "Video data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Video, as: Video
  alias Telebacon.Data.API.PhotoSize, as: PhotoSize
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
  @type t :: %Video{
    file_id: String.t,
    width: integer,
    height: integer,
    duration: integer,
    thumb: %PhotoSize{} | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec fromMap(%{}) :: %Video{}
  def fromMap(map) do
    val = PD.decode(map, as: %Video{})
    full_val = val
      |> H.fromMap(:thumb, PhotoSize)
    full_val
  end

  use Telebacon.Data.Inspect
end
