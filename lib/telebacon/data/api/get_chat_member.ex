defmodule Telebacon.Data.API.GetChatMember do
  @moduledoc "Represents call params for method /getChatMember"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %Telebacon.Data.API.GetChatMember{
    chat_id: integer | String.t,
    user_id: integer
  }
end
