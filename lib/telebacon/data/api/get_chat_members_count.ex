defmodule Telebacon.Data.API.GetChatMembersCount do
  @moduledoc "Represents call params for method /getChatMembersCount"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.API.GetChatMembersCount{
    chat_id: integer | String.t
  }
end
