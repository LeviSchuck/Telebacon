defmodule Telebacon.Data.API.GetUserProfilePhotos do
  @derive [Poison.Encoder]
  defstruct [
    :user_id,
    :offset,
    :limit
  ]
  @type t :: %Telebacon.Data.API.GetUserProfilePhotos{
    user_id: integer,
    offset: integer | nil,
    limit: integer | nil
  }
end