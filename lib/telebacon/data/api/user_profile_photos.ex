defmodule Telebacon.Data.API.UserProfilePhotos do
  @moduledoc "User Profile Photos data type for Telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  @derive [Poison.Encoder]
  defstruct [
    :total_count,
    :photos
  ]
  @type t :: %Telebacon.Data.API.UserProfilePhotos{
    total_count: integer,
    photos: [%Telebacon.Data.API.PhotoSize{}]
  }

  @spec fromMap(%{}) :: %Telebacon.Data.API.UserProfilePhotos{}
  def fromMap(map) do
    val = PD.decode(map, as: %Telebacon.Data.API.UserProfilePhotos{})
    full_val = val
      |> H.fromMapList(:photos, Telebacon.Data.API.PhotoSize)
    full_val
  end
end
