defmodule Telebacon.Data.API.GetChatAdministrators do
  @moduledoc "Represents call params for method /getChatAdministrators"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.API.GetChatAdministrators{
    chat_id: integer | String.t
  }
end
