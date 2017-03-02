defmodule Telebacon.Data.API.User do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :first_name,
    :last_name,
    :username
  ]
  @type t :: %Telebacon.Data.API.User{
    id: integer,
    first_name: String.t,
    last_name: String.t | nil,
    username: String.t | nil
  }
end