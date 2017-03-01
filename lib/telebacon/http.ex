defmodule Telebacon.HTTP do
  @moduledoc """
  Hosts the basic http calls
  """
  use HTTPoison.Base
  require Logger

  @headers [{"Content-Type", "application/json"}]

  def process_url(endpoint) do
    "https://api.telegram.org/" <> endpoint
  end
  def get_updates(key, offset, limit, timeout) do
    params = %{offset: offset, limit: limit, timeout: timeout}
    payload = Poison.encode!(params)
    {:ok, response} = Telebacon.HTTP.post(key <> "/getUpdates", payload, @headers)
    res = Poison.decode!(response.body)
    case Map.get(res, "ok", false) do
      true -> {:ok, Map.get(res, "result")}
      _ -> {:failure, res}
    end
  end

  def send_message(key, user, text, options) do
    params = Map.merge(options, %{chat_id: user, text: text})
    payload = Poison.encode!(params)
    {:ok, response} = Telebacon.HTTP.post(key <> "/sendMessage", payload, @headers)
    res = Poison.decode!(response.body)
    case Map.get(res, "ok", false) do
      true -> :ok
      _ -> {:failure, res}
    end
  end


end