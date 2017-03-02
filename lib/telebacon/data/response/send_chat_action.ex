defmodule Telebacon.Data.Response.SendChatAction do
  @derive [Poison.Encoder]
  defstruct [
    :chat_id,
    :action
  ]
  @type t :: %Telebacon.Data.Response.SendChatAction{
    chat_id: integer | String.t,
    action: String.t
  }
end