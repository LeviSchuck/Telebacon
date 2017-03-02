defmodule Telebacon.Data.API.GetFile do
  @moduledoc "Represents call params for method /getFile"
  @derive [Poison.Encoder]
  defstruct [
    :file_id
  ]
  @type t :: %Telebacon.Data.API.GetFile{
    file_id: String.t
  }
end
