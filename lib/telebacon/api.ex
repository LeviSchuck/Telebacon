defmodule Telebacon.API do
  @moduledoc """
  This hosts the typed requests and calls that can be made to Telegram
  """
  alias Telebacon.HTTP, as: HTTP
  alias Telebacon.Data.Updates.GetUpdates, as: UGU
  alias Telebacon.Data.Updates.Update, as: UU
  alias Telebacon.Data.Response.SendMessage, as: RSM

  @lint false
  def get_updates(key) do
    get_updates(key, %UGU{})
  end

  @spec get_updates(binary, %UGU{})
    :: {:ok, [%UU{}]}
    | {:failure, any}
  def get_updates(key, params) do
    {ty, response} = HTTP.call(key, "getUpdates", params)

    with  :ok <- ty,
          results = Map.get(response, "result"),
          false <- is_nil(results),
          parsed <- results |> Enum.map(fn u -> UU.fromMap(u) end) do
      {:ok, parsed}
    else
      _ -> {:failure, response}
    end
  end

  @spec send_message(binary, %RSM{}) :: any
  def send_message(key, message) do
    HTTP.call(key, "sendMessage", message)
  end

end
