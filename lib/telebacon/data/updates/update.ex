defmodule Telebacon.Data.Updates.Update do
  @moduledoc "Response for call /getUpdates"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Updates.Update, as: Update
  alias Telebacon.Data.API.Message, as: Message
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
  @type t :: %Update{
    update_id: integer,
    message: %Message{} | nil,
    edited_message: %Message{} | nil,
    channel_post: %Message{} | nil,
    edited_channel_post: %Message{} | nil,
    inline_query: %{} | nil,
    chosen_inline_result: %{} | nil,
    callback_query: %{} | nil
  }

  @spec fromMap(%{}) :: %Update{}
  def fromMap(map) when is_map(map) do
    val = PD.decode(map, as: %Update{})
    full_val = val
      |> H.fromMap(:message, Message)
      |> H.fromMap(:edited_message, Message)
      |> H.fromMap(:channel_post, Message)
      |> H.fromMap(:edited_channel_post, Message)
    full_val
  end

  use Telebacon.Data.Inspect
end
