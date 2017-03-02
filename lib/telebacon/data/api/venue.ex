defmodule Telebacon.Data.API.Venue do
  @derive [Poison.Encoder]
  defstruct [
    :location,
    :title,
    :address,
    :foursquare_id
  ]
  @type t :: %Telebacon.Data.API.Venue{
    location: %Telebacon.Data.API.Location{},
    title: String.t,
    address: String.t,
    foursquare_id: String.t | nil
  }
end