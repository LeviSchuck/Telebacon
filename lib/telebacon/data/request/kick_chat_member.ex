defmodule Telebacon.Data.Request.KickChatMember do
  @moduledoc "Represents call params for method /kickChatMember"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :user_id
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t,
    user_id: integer
  }
end
