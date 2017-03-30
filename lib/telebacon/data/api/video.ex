defmodule Telebacon.Data.API.Video do
  @moduledoc "Video data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.PhotoSize
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
  @type t :: %__MODULE__{
    file_id: String.t,
    width: integer,
    height: integer,
    duration: integer,
    thumb: PhotoSize.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:thumb, PhotoSize)
    full_val
  end

  use Telebacon.Data.Inspect
end
