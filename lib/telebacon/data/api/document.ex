defmodule Telebacon.Data.API.Document do
  @moduledoc "Document data type for Telegram"
  alias Telebacon.Data.Helper, as: H
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.PhotoSize
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :thumb,
    :file_name,
    :mime_type,
    :file_size
  ]
  @type t :: %__MODULE__{
    file_id: String.t,
    thumb: PhotoSize.t | nil,
    file_name: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:thumb, PhotoSize)
    full_val
  end

  use Telebacon.Data.Inspect
end
