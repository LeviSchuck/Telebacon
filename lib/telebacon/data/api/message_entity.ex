defmodule Telebacon.Data.API.MessageEntity do
  @derive [Poison.Encoder]
  defstruct [
    :type,
    :offset,
    :length,
    :url,
    :user
  ]
  @type t :: %Telebacon.Data.API.MessageEntity{
    type: String.t,
    offset: integer | nil,
    length: integer | nil,
    url: String.t | nil,
    user: %Telebacon.Data.API.User{} | nil
  }
end