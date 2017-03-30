defmodule Telebacon.Data.API.File do
  @moduledoc "File data type for Telegram"
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :file_size,
    :file_path
  ]
  @type t :: %__MODULE__{
    file_id: String.t,
    file_size: integer | nil,
    file_path: String.t | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
