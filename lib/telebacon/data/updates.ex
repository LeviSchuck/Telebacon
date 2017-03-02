defmodule Telebacon.Data.Updates do
  defmodule Update do
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
      message: %Telebacon.Data.API.Message{} | nil,
      edited_message: %Telebacon.Data.API.Message{} | nil,
      channel_post: %Telebacon.Data.API.Message{} | nil,
      inline_query: %{} | nil,
      chosen_inline_result: %{} | nil,
      callback_query: %{} | nil
    }
  end
  defmodule GetUpdates do
    @derive [Poison.Encoder]
    defstruct [
      :offset,
      :limit,
      :timeout,
      :allowed_updates
    ]
    @type t :: %GetUpdates{
      offset: integer | nil,
      limit: integer | nil,
      timeout: integer | nil,
      allowed_updates: integer | nil
    }
  end
end