defmodule Telebacon.HTTP do
  @moduledoc """
  Hosts the basic http calls
  """
  use HTTPoison.Base
  require Logger

  @headers [{"Content-Type", "application/json"}]

  @spec process_url(binary) :: binary
  def process_url(endpoint) do
    "https://api.telegram.org/" <> endpoint
  end

  @spec get_updates(binary, integer | nil, integer | nil, integer | nil)
    :: {:ok, [%{}]}
    | {:failure, %{}}
  def get_updates(key, offset, limit, timeout) do
    params = %{offset: offset, limit: limit, timeout: timeout}
    payload = Poison.encode!(params)
    {:ok, response} = post(key <> "/getUpdates", payload, @headers)
    res = Poison.decode!(response.body)
    case Map.get(res, "ok", false) do
      true -> {:ok, Map.get(res, "result")}
      _ -> {:failure, res}
    end
  end

  @spec send_message(binary, String.t | integer, binary, %{})
    :: :ok
    | {:failure, %{}}
  def send_message(key, chat_id, text, options) do
    params = Map.merge(options, %{chat_id: chat_id, text: text})
    payload = Poison.encode!(params)
    {:ok, response} = post(key <> "/sendMessage", payload, @headers)
    res = Poison.decode!(response.body)
    case Map.get(res, "ok", false) do
      true -> :ok
      _ -> {:failure, res}
    end
  end

end
