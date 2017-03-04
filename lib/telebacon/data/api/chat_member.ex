defmodule Telebacon.Data.API.ChatMember do
  @moduledoc "Chat Member data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.ChatMember, as: ChatMember
  alias Telebacon.Data.API.User, as: User
  @derive [Poison.Encoder]
  defstruct [
    :user,
    :status
  ]
  @type t :: %ChatMember{
    user: %User{},
    status: String.t
  }

  @spec fromMap(%{}) :: %ChatMember{}
  def fromMap(map) do
    val = PD.decode(map, as: %ChatMember{})
    full_val = val
      |> H.fromMap(:user, User)
    full_val
  end

  use Telebacon.Data.Inspect
end
