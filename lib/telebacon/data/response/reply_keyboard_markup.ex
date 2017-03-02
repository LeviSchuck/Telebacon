defmodule Telebacon.Data.Response.ReplyKeyboardMarkup do
  @derive [Poison.Encoder]
  defstruct [
    :keyboard,
    :resize_keyboard,
    :one_time_keyboard,
    :selective
  ]
  @type t :: %Telebacon.Data.Response.ReplyKeyboardMarkup{
    keyboard: [[%Telebacon.Data.Response.KeyboardButton{}]],
    resize_keyboard: boolean | nil,
    one_time_keyboard: boolean | nil,
    selective: boolean | nil
  }
end