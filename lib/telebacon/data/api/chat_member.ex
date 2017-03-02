defmodule Telebacon.Data.API.ChatMember do
  @derive [Poison.Encoder]
  defstruct [
    :user,
    :status
  ]
  @type t :: %Telebacon.Data.API.ChatMember{
    user: %Telebacon.Data.API.User{},
    status: String.t
  }
end