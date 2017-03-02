defmodule Telebacon.Data.API.Chat do
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :type,
    :title,
    :username,
    :first_name,
    :last_name,
    :all_members_are_administrators
  ]
  @type t :: %Telebacon.Data.API.Chat{
    id: integer,
    type: String.t,
    title: String.t | nil,
    username: String.t | nil,
    first_name: String.t | nil,
    last_name: String.t | nil,
    all_members_are_administrators: boolean | nil
  }
end