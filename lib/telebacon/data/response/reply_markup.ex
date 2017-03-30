defmodule Telebacon.Data.Response.ReplyMarkup do
  @moduledoc """
  Just a placeholder for a common type
  """
  @type t
    :: Telebacon.Data.Response.ReplyKeyboardMarkup.t
    | Telebacon.Data.Response.ReplyKeyboardRemove.t
    | Telebacon.Data.Response.ForceReply.t
    | %{}
    | nil

end
