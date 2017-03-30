defmodule Telebacon.Data.API.ResponseParameters do
  alias Poison.Decode, as: PD
  @moduledoc "Error responses may include data from here"
  @derive [Poison.Encoder]
  defstruct [
    :migrate_to_chat_id,
    :retry_after
  ]
  @type t :: %__MODULE__{
    migrate_to_chat_id: integer | nil,
    retry_after: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
