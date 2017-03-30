defmodule Telebacon.HTTP do
  @moduledoc false
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

  @spec download_url(binary, Path.t)
    :: {:ok, Path.t} | {:error, any}
  def download_url(url, name) do
    case open_temp(name) do
      {:ok, fd, file_path} ->
        res = async_get(url, fd, file_path)
        File.close(fd)
        res
      {:error, err} -> {:error, err}
    end
  end

  @spec open_temp(Path.t)
    :: {:ok, File.io_device, Path.t} | {:error, any}
  defp open_temp(name) do
    Temp.open(Path.basename(name))
  end

  @spec async_get(binary, File.io_device, Path.t)
    :: {:ok, Path.t} | {:error, any}
  defp async_get(url, fd, file_path) do
    {:ok, prev} = get(url, [], [async: :once, stream_to: self()])
    :ok = collect_download(prev, :ok, fd)
    {:ok, file_path}
  rescue
    err ->
      Logger.warn "Got error during download: #{inspect err}"
      {:error, err}
  end

  defp collect_download(prev, status, fd) do
    {:ok, stat} = stream_next(prev)
    receive do
      %HTTPoison.AsyncChunk{chunk: chunk} ->
        IO.binwrite(fd, chunk)
        collect_download(stat, status, fd)
      %HTTPoison.AsyncEnd{} -> status
      %HTTPoison.AsyncHeaders{} ->
        collect_download(stat, status, fd)
      %HTTPoison.AsyncStatus{code: 200} ->
        collect_download(stat, status, fd)
      %HTTPoison.AsyncStatus{code: code} ->
        collect_download(stat, {:bad_status, code}, fd)
    end
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
