defmodule Telebacon.Data.API.User do
  @moduledoc "User data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  defstruct [
    :id,
    :first_name,
    :last_name,
    :username
  ]
  @type t :: %__MODULE__{
    id: integer,
    first_name: String.t,
    last_name: String.t | nil,
    username: String.t | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
