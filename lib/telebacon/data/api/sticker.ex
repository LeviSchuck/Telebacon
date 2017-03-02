defmodule Telebacon.Data.API.Sticker do
  @moduledoc "Sticker data type for Telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.Sticker, as: Sticker
  alias Telebacon.Data.API.PhotoSize, as: PhotoSize
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :thumb,
    :emoji,
    :file_size
  ]
  @type t :: %Sticker{
    file_id: String.t,
    width: integer,
    height: integer,
    thumb: %PhotoSize{} | nil,
    emoji: String.t | nil,
    file_size: integer | nil
  }

  @spec fromMap(%{}) :: %Sticker{}
  def fromMap(map) do
    val = PD.decode(map, as: %Sticker{})
    full_val = val
      |> H.fromMap(:thumb, PhotoSize)
    full_val
  end
end
