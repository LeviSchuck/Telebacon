defmodule Telebacon.Data.Request.LeaveChat do
  @moduledoc "Represents call params for method /leaveChat"
  @derive [Poison.Encoder]
  defstruct [
    :chat_id
  ]
  @type t :: %__MODULE__{
    chat_id: integer | String.t
  }
end
