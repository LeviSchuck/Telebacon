defmodule Telebacon.Data.Request.GetChatMembersCount do
  @moduledoc "Represents call params for method /getChatMembersCount"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.Request.GetChatMembersCount{
    chat_id: integer | String.t
  }
end
