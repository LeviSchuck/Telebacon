defmodule Telebacon.Data.API.Audio do
  @moduledoc "Audio data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  defstruct [
    :file_id,
    :duration,
    :performer,
    :title,
    :mime_type,
    :file_size
  ]
  @type t :: %__MODULE__{
    file_id: String.t,
    duration: integer,
    performer: String.t | nil,
    title: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
