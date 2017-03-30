defmodule Telebacon.Data.API.Voice do
  @moduledoc "Voice data type for telegram"
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :duration,
    :mime_type,
    :file_size
  ]
  @type t :: %__MODULE__{
    file_id: String.t,
    duration: integer,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
