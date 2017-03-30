defmodule Telebacon.Data.API.Location do
  @moduledoc "Location data type for Telegram"
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :longitude,
    :latitude
  ]
  @type t :: %__MODULE__{
    longitude: float,
    latitude: float
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
