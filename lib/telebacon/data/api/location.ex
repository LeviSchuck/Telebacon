defmodule Telebacon.Data.API.Location do
  @derive [Poison.Encoder]
  defstruct [
    :longitude,
    :latitude
  ]
  @type t :: %Telebacon.Data.API.Location{
    longitude: float,
    latitude: float
  }
end