defmodule Telebacon.Data.Response.ForceReply do
  @derive [Poison.Encoder]
  defstruct [
    :force_reply,
    :selective
  ]
  @type t :: %Telebacon.Data.Response.ForceReply{
    force_reply: boolean,
    selective: boolean | nil
  }
end