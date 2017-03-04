defmodule Telebacon.Data.API.Venue do
  @moduledoc "Venue data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Venue, as: Venue
  alias Telebacon.Data.API.Location, as: Location
  @derive [Poison.Encoder]
  defstruct [
    :location,
    :title,
    :address,
    :foursquare_id
  ]
  @type t :: %Venue{
    location: %Location{},
    title: String.t,
    address: String.t,
    foursquare_id: String.t | nil
  }

  @spec fromMap(%{}) :: %Venue{}
  def fromMap(map) do
    val = PD.decode(map, as: %Venue{})
    full_val = val
      |> H.fromMap(:location, Location)
    full_val
  end

  use Telebacon.Data.Inspect
end
