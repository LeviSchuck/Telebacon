defmodule Telebacon.Demo do
  @moduledoc """
  This is a basic debugging tool, it is an echo-bot.
  """
  @behaviour Telebacon.Adapter
  require Logger
  alias Telebacon.Data.Response, as: R
  alias Telebacon.Data.API, as: A
  alias Telebacon.API, as: API

  @spec chat_update(%A.Update{}, binary, any) :: :ok
  def chat_update(%A.Update{message: m}, key, _) when not is_nil(m) do
    Logger.debug "Got message! #{inspect m}"
    cid = m.chat.id
    if not is_nil(m.text) do
      param = %R.SendMessage{
        chat_id: cid,
        text: m.text,
        reply_to_message_id: m.message_id
      }
      API.send_message(key, param)
    end
    :ok
  end
  def chat_update(_, _, _), do: :ok
end
