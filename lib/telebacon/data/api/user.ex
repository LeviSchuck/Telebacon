defmodule Telebacon.Data.API.User do
  @moduledoc "User data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.User, as: User
  defstruct [
    :id,
    :first_name,
    :last_name,
    :username
  ]
  @type t :: %User{
    id: integer,
    first_name: String.t,
    last_name: String.t | nil,
    username: String.t | nil
  }

  @spec fromMap(%{}) :: %User{}
  def fromMap(map) do
    val = PD.decode(map, as: %User{})
    val
  end
end
