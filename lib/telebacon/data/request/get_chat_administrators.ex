defmodule Telebacon.Data.Request.GetChatAdministrators do
  @moduledoc "Represents call params for method /getChatAdministrators"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.Request.GetChatAdministrators{
    chat_id: integer | String.t
  }
end
