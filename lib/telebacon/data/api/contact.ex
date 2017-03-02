defmodule Telebacon.Data.API.Contact do
  @moduledoc "Contact data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Contact, as: Contact
  defstruct [
    :phone_number,
    :first_name,
    :last_name,
    :user_id
  ]
  @type t :: %Contact{
    phone_number: String.t,
    first_name: String.t,
    last_name: String.t | nil,
    user_id: integer | nil
  }

  @spec fromMap(%{}) :: %Contact{}
  def fromMap(map) do
    val = PD.decode(map, as: %Contact{})
    val
  end
end
