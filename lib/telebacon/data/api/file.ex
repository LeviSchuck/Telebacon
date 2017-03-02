defmodule Telebacon.Data.API.File do
  @moduledoc "File data type for Telegram"
  alias Poison.Decode, as: PD
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

  @spec fromMap(%{}) :: %Telebacon.Data.API.File{}
  def fromMap(map) do
    val = PD.decode(map, as: %Telebacon.Data.API.File{})
    val
  end
end
