defmodule Telebacon.Data.API.Audio do
  @moduledoc "Audio data type for Telegram"
  @derive [Poison.Encoder]
  alias Poison.Decode, as: PD
  alias Telebacon.Data.API.Audio, as: Audio
  defstruct [
    :file_id,
    :duration,
    :performer,
    :title,
    :mime_type,
    :file_size
  ]
  @type t :: %Audio{
    file_id: String.t,
    duration: integer,
    performer: String.t | nil,
    title: String.t | nil,
    mime_type: String.t | nil,
    file_size: integer | nil
  }

  @spec fromMap(%{}) :: %Audio{}
  def fromMap(map) do
    val = PD.decode(map, as: %Audio{})
    val
  end

  use Telebacon.Data.Inspect
end
