defmodule Telebacon.Data.API.KickChatMember do
  @moduledoc "Represents call params for method /kickChatMember"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %Telebacon.Data.API.KickChatMember{
    chat_id: integer | String.t,
    user_id: integer
  }
end
