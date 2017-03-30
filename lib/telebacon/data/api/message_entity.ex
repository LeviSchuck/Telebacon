defmodule Telebacon.Data.API.MessageEntity do
  @moduledoc "Message Entity data type for Telegram, these have mentions and the like"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.User
  @derive [Poison.Encoder]
  defstruct [
    :type,
    :offset,
    :length,
    :url,
    :user
  ]
  @type t :: %__MODULE__{
    type: String.t,
    offset: integer | nil,
    length: integer | nil,
    url: String.t | nil,
    user: User.t | nil
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
