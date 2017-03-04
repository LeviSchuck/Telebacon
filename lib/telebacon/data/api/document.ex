defmodule Telebacon.Data.API.Document do
  @moduledoc "Document data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Document, as: Document
  alias Telebacon.Data.API.PhotoSize, as: PhotoSize
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :thumb,
    :file_name,
    :mime_type,
    :file_size
  ]
  @type t :: %Document{
    file_id: String.t,
    thumb: %PhotoSize{} | nil,
    file_name: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec fromMap(%{}) :: %Document{}
  def fromMap(map) do
    val = PD.decode(map, as: %Document{})
    full_val = val
      |> H.fromMap(:thumb, PhotoSize)
    full_val
  end

  use Telebacon.Data.Inspect
end
