defmodule Telebacon.Data.Response.KeyboardButton do
  @derive [Poison.Encoder]
  defstruct [
    :text,
    :request_contact,
    :request_location
  ]
  @type t :: %Telebacon.Data.Response.KeyboardButton{
    text: String.t,
    request_contact: boolean | nil,
    request_location: boolean | nil
  }
end