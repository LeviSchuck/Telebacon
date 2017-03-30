defmodule Telebacon.Data.Request.GetUserProfilePhotos do
  @moduledoc "Represents call params for method /getUserProfilePhotos"
  @derive [Poison.Encoder]
  defstruct [
    :user_id,
    :offset,
    :limit
  ]
  @type t :: %__MODULE__{
    user_id: integer,
    offset: integer | nil,
    limit: integer | nil
  }
end
