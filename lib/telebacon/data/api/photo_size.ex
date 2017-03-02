defmodule Telebacon.Data.API.PhotoSize do
  @moduledoc "Photo Size data type for Telegram, primarily for photos, also includes dimensions."
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.PhotoSize, as: PhotoSize
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :file_size
  ]
  @type t :: %PhotoSize{
    file_id: String.t,
    width: integer,
    height: integer,
    file_size: integer | nil
  }

  @spec fromMap(%{}) :: %PhotoSize{}
  def fromMap(map) do
    val = PD.decode(map, as: %PhotoSize{})
    val
  end
end
