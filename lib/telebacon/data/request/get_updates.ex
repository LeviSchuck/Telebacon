defmodule Telebacon.Data.Request.GetUpdates do
  @moduledoc "Represents call params for method /getUpdates"
  @derive [Poison.Encoder]
  defstruct [
    :offset,
    :limit,
    :timeout,
    :allowed_updates
  ]
  @type t :: %__MODULE__{
    offset: integer | nil,
    limit: integer | nil,
    timeout: integer | nil,
    allowed_updates: integer | nil
  }
end
