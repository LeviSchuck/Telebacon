defmodule Telebacon.Data.Request.KickChatMember do
  @moduledoc "Represents call params for method /kickChatMember"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %Telebacon.Data.Request.KickChatMember{
    chat_id: integer | String.t,
    user_id: integer
  }
end
