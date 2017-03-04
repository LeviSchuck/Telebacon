defmodule Telebacon.Data.API.Location do
  @moduledoc "Location data type for Telegram"
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :longitude,
    :latitude
  ]
  @type t :: %Telebacon.Data.API.Location{
    longitude: float,
    latitude: float
  }

  @spec fromMap(%{}) :: %Telebacon.Data.API.Location{}
  def fromMap(map) do
    val = PD.decode(map, as: %Telebacon.Data.API.Location{})
    val
  end

  use Telebacon.Data.Inspect
end
