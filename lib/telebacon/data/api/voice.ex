defmodule Telebacon.Data.API.Voice do
  @moduledoc "Voice data type for telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Voice, as: Voice
  @derive [Poison.Encoder]
  defstruct [
    :file_id,
    :duration,
    :mime_type,
    :file_size
  ]
  @type t :: %Voice{
    file_id: String.t,
    duration: integer,
    mime_type: String.t | nil,
    file_size: integer | nil
  }
  @spec fromMap(%{}) :: %Voice{}
  def fromMap(map) do
    val = PD.decode(map, as: %Voice{})
    val
  end
end
