defmodule Telebacon.Data.API.Contact do
  @derive [Poison.Encoder]
  defstruct [
    :phone_number,
    :first_name,
    :last_name,
    :user_id
  ]
  @type t :: %Telebacon.Data.API.Contact{
    phone_number: String.t,
    first_name: String.t,
    last_name: String.t | nil,
    user_id: integer | nil
  }
end