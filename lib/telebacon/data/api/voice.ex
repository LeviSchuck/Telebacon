defmodule Telebacon.Data.API.Voice do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :duration,
    :mime_type,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.Voice{
    file_id: String.t,
    duration: integer,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
end