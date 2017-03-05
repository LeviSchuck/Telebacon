defmodule Telebacon.HTTP do
  @moduledoc """
  Hosts the basic http calls, works with things that can be encoded.
  """
  use HTTPoison.Base
  require Logger

  @headers [{"Content-Type", "application/json"}]

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
    {:ok, response} = post(key <> "/" <> method, payload, @headers)
    res = Poison.decode!(response.body)
    case Map.get(res, "ok", false) do
      true -> {:ok, res}
      _ -> {:failure, res}
    end
  end
end
