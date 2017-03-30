defmodule Telebacon.Data.API.Chat do
  @moduledoc "Chat data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  defstruct [
    :id,
    :type,
    :title,
    :username,
    :first_name,
    :last_name,
    :all_members_are_administrators
  ]
  @type t :: %__MODULE__{
    id: integer,
    type: String.t,
    title: String.t | nil,
    username: String.t | nil,
    first_name: String.t | nil,
    last_name: String.t | nil,
    all_members_are_administrators: boolean | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
