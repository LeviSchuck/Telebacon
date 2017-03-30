defmodule Telebacon.Data.API.Contact do
  @moduledoc "Contact data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  defstruct [
    :phone_number,
    :first_name,
    :last_name,
    :user_id
  ]
  @type t :: %__MODULE__{
    phone_number: String.t,
    first_name: String.t,
    last_name: String.t | nil,
    user_id: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
