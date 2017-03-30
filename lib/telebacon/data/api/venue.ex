defmodule Telebacon.Data.API.Venue do
  @moduledoc "Venue data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Location
  @derive [Poison.Encoder]
  defstruct [
    :location,
    :title,
    :address,
    :foursquare_id
  ]
  @type t :: %__MODULE__{
    location: Location.t,
    title: String.t,
    address: String.t,
    foursquare_id: String.t | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:location, Location)
    full_val
  end

  use Telebacon.Data.Inspect
end
