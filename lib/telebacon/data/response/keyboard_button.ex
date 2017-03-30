defmodule Telebacon.Data.Response.KeyboardButton do
  @moduledoc "Messaging command parameters for a single keyboard button"
  @derive [Poison.Encoder]
  defstruct [
    :text,
    :request_contact,
    :request_location
  ]
  @type t :: %__MODULE__{
    text: String.t,
    request_contact: boolean | nil,
    request_location: boolean | nil
  }
end
