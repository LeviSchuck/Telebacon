defmodule Telebacon.Data.API.ChatMember do
  @moduledoc "Chat Member data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.User
  @derive [Poison.Encoder]
  defstruct [
    :user,
    :status
  ]
  @type t :: %__MODULE__{
    user: User.t,
    status: String.t
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:user, User)
    full_val
  end

  use Telebacon.Data.Inspect
end
