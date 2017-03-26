defmodule Telebacon.API do
  @moduledoc """
  This hosts the typed requests and calls that can be made to Telegram
  """
  require Telebacon.SimpleAPI
  require Logger
  alias Telebacon.HTTP
  alias Telebacon.SimpleAPI, as: Simple
  alias Telebacon.Data.API, as: A
  alias Telebacon.Data.Request, as: RQ
  alias Telebacon.Data.Response, as: RS

  def get_updates(key), do: get_updates(key, %{})

  # Telegram API
  Simple.call [:get, :updates], RQ.GetUpdates, [A.Update]
  Simple.call [:get, :me], A.User
  Simple.call [:get, :file], RQ.GetFile, A.File
  Simple.call [:get, :chat], RQ.GetChat, A.Chat
  Simple.call [:get, :user, :profile, :photos],
    RQ.GetUserProfilePhotos,
    A.UserProfilePhotos
  Simple.call [:get, :chat, :administrators],
    RQ.GetChatAdministrators,
    [A.ChatMember]
  Simple.call [:get, :chat, :members, :count],
    RQ.GetChatMembersCount,
    :integer
  Simple.call [:get, :chat, :member],
    RQ.GetChatMember,
    A.ChatMember

  Simple.call [:send, :message], RS.SendMessage, A.Message
  Simple.call [:forward, :message], RS.ForwardMessage, A.Message
  Simple.call [:send, :photo], RS.SendPhoto, A.Message
  Simple.call [:send, :audio], RS.SendAudio, A.Message
  Simple.call [:send, :document], RS.SendDocument, A.Message
  Simple.call [:send, :sticker], RS.SendSticker, A.Message
  Simple.call [:send, :video], RS.SendVideo, A.Message
  Simple.call [:send, :voice], RS.SendVoice, A.Message
  Simple.call [:send, :location], RS.SendLocation, A.Message
  Simple.call [:send, :venue], RS.SendVenue, A.Message
  Simple.call [:send, :contact], RS.SendContact, A.Message
  Simple.call [:send, :chat, :action], RS.SendChatAction, :bool
  Simple.call [:unban, :chat, :member], RQ.UnbanChatMember, :bool
  Simple.call [:kick, :chat, :member], RQ.KickChatMember, :bool
  Simple.call [:leave, :chat], RQ.LeaveChat, :bool

  @spec download_file(binary, binary) :: binary
  def download_file(key, file_path) do
    url = "file/" <> key <> "/" <> file_path
    Logger.info "Download url: #{url}"
    {:ok, fd, save_path} = HTTP.download_url(url, file_path)
    File.close(fd)
    save_path
  end

  # Private
  defp handleResult(:ok, response, parsefn) do
    with  results = Map.get(response, "result"),
          false <- is_nil(results),
          parsed <- parsefn.(results) do
      {:ok, parsed}
    else
      _ -> {:failure, response}
    end
  end
  defp handleResult(_, response, _) do
    {:failure, response}
  end

end
