defmodule Telebacon.Data.Request.SetWebhook do
  @moduledoc "Represents call params for method /setWebhook"
  @derive [Poison.Encoder]
  defstruct [
    :url,
    # :certificate, # InputFiles not support
    :max_connections,
    :allowed_updates,
  ]
  @type t :: %__MODULE__{
    url: String.t,
    # certificate: InputFile.t,
    max_connections: integer | nil,
    allowed_updates: [String.t] | nil,
  }
end
