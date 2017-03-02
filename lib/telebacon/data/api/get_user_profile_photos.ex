defmodule Telebacon.Data.API.GetUserProfilePhotos do
  @moduledoc "Represents call params for method /getUserProfilePhotos"
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
