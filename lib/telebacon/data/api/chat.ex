defmodule Telebacon.Data.API.Chat do
  @moduledoc "Chat data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Chat, as: Chat
  defstruct [
    :id,
    :type,
    :title,
    :username,
    :first_name,
    :last_name,
    :all_members_are_administrators
  ]
  @type t :: %Chat{
    id: integer,
    type: String.t,
    title: String.t | nil,
    username: String.t | nil,
    first_name: String.t | nil,
    last_name: String.t | nil,
    all_members_are_administrators: boolean | nil
  }

  @spec fromMap(%{}) :: %Chat{}
  def fromMap(map) do
    val = PD.decode(map, as: %Chat{})
    val
  end

  use Telebacon.Data.Inspect
end
