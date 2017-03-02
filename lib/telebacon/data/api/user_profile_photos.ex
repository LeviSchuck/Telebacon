defmodule Telebacon.Data.API.UserProfilePhotos do
  @derive [Poison.Encoder]
  defstruct [
    :total_count,
    :photos
  ]
  @type t :: %Telebacon.Data.API.UserProfilePhotos{
    total_count: integer,
    photos: [%Telebacon.Data.API.PhotoSize{}]
  }
end