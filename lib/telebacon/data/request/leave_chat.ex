defmodule Telebacon.Data.Request.LeaveChat do
  @moduledoc "Represents call params for method /leaveChat"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %Telebacon.Data.Request.KickChatMember{
    chat_id: integer | String.t
  }
end
