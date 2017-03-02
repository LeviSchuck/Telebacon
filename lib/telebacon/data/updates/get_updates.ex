defmodule Telebacon.Data.Updates.GetUpdates do
  @moduledoc "Represents call params for method /getUpdates"
  @derive [Poison.Encoder]
  defstruct [
    :offset,
    :limit,
    :timeout,
    :allowed_updates
  ]
  @type t :: %Telebacon.Data.Updates.GetUpdates{
    offset: integer | nil,
    limit: integer | nil,
    timeout: integer | nil,
    allowed_updates: integer | nil
  }
end
