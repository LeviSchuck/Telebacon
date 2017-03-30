defmodule Telebacon.Data.Response.ForceReply do
  @moduledoc "Messaging command parameters to force a response from a chat user"
  @derive [Poison.Encoder]
  defstruct [
    :force_reply,
    :selective
  ]
  @type t :: %__MODULE__{
    force_reply: boolean,
    selective: boolean | nil
  }
end
