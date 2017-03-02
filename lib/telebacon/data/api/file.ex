defmodule Telebacon.Data.API.File do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :file_size,
    :file_path
  ]
  @type t :: %Telebacon.Data.API.File{
    file_id: String.t,
    file_size: integer | nil,
    file_path: String.t | nil
  }
end