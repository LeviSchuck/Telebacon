defmodule Telebacon.Data.Response.ReplyKeyboardRemove do
  @moduledoc "Messaging command parameters to remove a currently prompted keyboard"
  @derive [Poison.Encoder]
  defstruct [
    :remove_keyboard,
    :selective
  ]
  @type t :: %Telebacon.Data.Response.ReplyKeyboardRemove{
    remove_keyboard: boolean,
    selective: boolean | nil
  }
end
