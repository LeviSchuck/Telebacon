defmodule Telebacon.Data.API.Update do
  @moduledoc "Response for call /getUpdates"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Message
  alias Telebacon.Data.API.CallbackQuery
  @derive [Poison.Encoder]
  defstruct [
    :update_id,
    :message,
    :edited_message,
    :channel_post,
    :edited_channel_post,
    :inline_query,
    :chosen_inline_result,
    :callback_query
  ]
  @type t :: %__MODULE__{
    update_id: integer,
    message: Message.t | nil,
    edited_message: Message.t | nil,
    channel_post: Message.t | nil,
    edited_channel_post: Message.t | nil,
    inline_query: %{} | nil,
    chosen_inline_result: %{} | nil,
    callback_query: %{} | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) when is_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:message, Message)
      |> H.from_map(:edited_message, Message)
      |> H.from_map(:channel_post, Message)
      |> H.from_map(:edited_channel_post, Message)
      |> H.from_map(:callback_query, CallbackQuery)
    full_val
  end

  use Telebacon.Data.Inspect
end
