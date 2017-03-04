defmodule Telebacon.Data.API.ResponseParameters do
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.ResponseParameters, as: RP
  @moduledoc "Error responses may include data from here"
  @derive [Poison.Encoder]
  defstruct [
    :migrate_to_chat_id,
    :retry_after
  ]
  @type t :: %RP{
    migrate_to_chat_id: integer | nil,
    retry_after: integer | nil
  }

  @spec fromMap(%{}) :: %RP{}
  def fromMap(map) do
    val = PD.decode(map, as: %RP{})
    val
  end

  use Telebacon.Data.Inspect
end
