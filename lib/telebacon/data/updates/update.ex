defmodule Telebacon.Data.Updates.Update do
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
  @type t :: %Telebacon.Data.Updates.Update{
    update_id: integer,
    message: %Telebacon.Data.API.Message{} | nil,
    edited_message: %Telebacon.Data.API.Message{} | nil,
    channel_post: %Telebacon.Data.API.Message{} | nil,
    inline_query: %{} | nil,
    chosen_inline_result: %{} | nil,
    callback_query: %{} | nil
  }
end