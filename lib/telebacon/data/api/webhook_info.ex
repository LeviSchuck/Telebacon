defmodule Telebacon.Data.API.WebhookInfo do
  @moduledoc "Webhookinfo data type for Telegram"
  alias Poison.Decode, as: PD
  @derive [Poison.Encoder]
  defstruct [
    :url,
    :has_custom_certificate,
    :pending_update_count,
    :last_error_date,
    :last_error_message,
    :max_connections,
    :allowed_updates,
  ]
  @type t :: %__MODULE__{
    url: String.t,
    has_custom_certificate: boolean,
    pending_update_count: integer,
    last_error_date: integer | nil,
    last_error_message: String.t | nil,
    max_connections: integer | nil,
    allowed_updates: [String.t] | nil,
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    val
  end

  use Telebacon.Data.Inspect
end
