defmodule Telebacon.HTTP do
  @moduledoc """
  Hosts the basic http calls, works with things that can be encoded.
  """
  use HTTPoison.Base
  require Logger

  @headers [
    {"Content-Type", "application/json"}
  ]
  @big_timeout 1_000_000
  @options [
    connect_timeout: @big_timeout,
    recv_timeout: @big_timeout,
    timeout: @big_timeout
  ]

  @spec process_url(binary) :: binary
  def process_url(endpoint) do
    "https://api.telegram.org/" <> endpoint
  end

  @spec call(binary, binary, %{} | struct | nil)
    :: {:ok, any}
    | {:failure, %{}}
  def call(key, method, params) do
    payload = case params do
      %{} ->
        map_params = case Map.get(params, :__struct__) do
          nil -> params
          _ -> Map.from_struct(params)
        end
        filtered_params = map_params
          |> Enum.filter(fn {_, v} -> not is_nil(v) end)
          |> Enum.into(%{})
        json = Poison.encode!(filtered_params)
        json
      nil -> "{}"
    end
    url = key <> "/" <> method
    {ty, response} = post(url, payload, @headers, @options)
    case ty do
      :ok ->
        res = Poison.decode!(response.body)
        case Map.get(res, "ok", false) do
          true -> {:ok, res}
          _ -> {:failure, res}
        end
      :error -> {:failure, response}
    end
  end
end
