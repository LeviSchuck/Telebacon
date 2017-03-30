defmodule Telebacon.Demo do
  @moduledoc """
  This is a basic demonstration of a bot that echos text from users.
  """
  @behaviour Telebacon.Adapter
  require Logger
  import Telebacon
  alias Telebacon.Data.Response, as: R
  alias Telebacon.Data.API, as: A

  @spec chat_update(binary, %A.Update{}, any) :: :ok
  def chat_update(key, %A.Update{message: m}, _) when not is_nil(m) do
    Logger.debug "Got message! #{inspect m}"
    cid = m.chat.id
    if not is_nil(m.text) do
      param = %R.SendMessage{
        chat_id: cid,
        text: m.text,
        reply_to_message_id: m.message_id
      }
      send_message(key, param)
    end
    :ok
  end
  def chat_update(_, _, _), do: :ok
end
