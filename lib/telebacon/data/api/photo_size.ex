defmodule Telebacon.Data.API.PhotoSize do
  @moduledoc "Photo Size data type for Telegram, primarily for photos, also includes dimensions."
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :file_size
  ]
  @type t :: %__MODULE__{
    file_id: String.t,
    width: integer,
    height: integer,
    file_size: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
