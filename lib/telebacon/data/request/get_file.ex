defmodule Telebacon.Data.Request.GetFile do
  @moduledoc "Represents call params for method /getFile"
  @derive [Poison.Encoder]
  defstruct [
    :file_id
  ]
  @type t :: %__MODULE__{
    file_id: String.t
  }
end
