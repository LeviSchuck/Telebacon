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
  end
  defmodule GetUpdates do
    @derive [Poison.Encoder]
    defstruct [
      :offset,
      :limit,
      :timeout,
      :allowed_updates
    ]
  end
end