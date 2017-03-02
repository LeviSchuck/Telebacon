defmodule Telebacon.Data.API.Audio do
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :duration,
    :performer,
    :title,
    :mime_type,
    :file_size
  ]
  @type t :: %Telebacon.Data.API.Audio{
    file_id: String.t,
    duration: integer,
    performer: String.t | nil,
    title: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
end