defmodule Telebacon.Data.API.MessageEntity do
  @moduledoc "Message Entity data type for Telegram, these have mentions and the like"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.MessageEntity, as: MessageEntity
  alias Telebacon.Data.API.User, as: User
  @derive [Poison.Encoder]
  defstruct [
    :type,
    :offset,
    :length,
    :url,
    :user
  ]
  @type t :: %MessageEntity{
    type: String.t,
    offset: integer | nil,
    length: integer | nil,
    url: String.t | nil,
    user: %User{} | nil
  }

  @spec fromMap(%{}) :: %MessageEntity{}
  def fromMap(map) do
    val = PD.decode(map, as: %MessageEntity{})
    full_val = val
      |> H.fromMap(:user, User)
    full_val
  end
end
