defmodule Telebacon.Data.API.CallbackQuery do
  @moduledoc "CallbackQuery data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.User
  alias Telebacon.Data.API.Message
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :from,
    :message,
    :inline_message_id,
    :chat_instance,
    :data,
    :game_short_name,
  ]
  @type t :: %__MODULE__{
    id: String.t,
    from: User.t,
    message: Message.t | nil,
    inline_message_id: String.t | nil,
    chat_instance: String.t,
    data: String.t | nil,
    game_short_name: String.t | nil,
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:message, Message)
      |> H.from_map(:user, User)
    full_val
  end

  use Telebacon.Data.Inspect
end
