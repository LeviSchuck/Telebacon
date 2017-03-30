defmodule Telebacon.Data.Request.GetChatAdministrators do
  @moduledoc "Represents call params for method /getChatAdministrators"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t
  }
end
