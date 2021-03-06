defmodule Telebacon.Data.Request.GetChat do
  @moduledoc "Represents call params for method /getChat"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t
  }
end
