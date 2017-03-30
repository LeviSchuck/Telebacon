defmodule Telebacon.Data.API.UserProfilePhotos do
  @moduledoc "User Profile Photos data type for Telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.PhotoSize
  @derive [Poison.Encoder]
  defstruct [
    :total_count,
    :photos
  ]
  @type t :: %__MODULE__{
    total_count: integer,
    photos: [PhotoSize.t]
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map_list(:photos, PhotoSize)
    full_val
  end

  use Telebacon.Data.Inspect
end
