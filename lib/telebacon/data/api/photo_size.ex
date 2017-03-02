defmodule Telebacon.Data.API.PhotoSize do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :width,
    :height,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.PhotoSize{
    file_id: String.t,
    width: integer,
    height: integer,
    file_size: integer | nil
  }
end