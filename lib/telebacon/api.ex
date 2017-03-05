defmodule Telebacon.API do
  @moduledoc """
  This hosts the typed requests and calls that can be made to Telegram
  """
  require Telebacon.SimpleAPI
  require Logger
  alias Telebacon.HTTP, as: HTTP
  alias Telebacon.SimpleAPI, as: Simple
  alias Telebacon.Data.Updates.GetUpdates, as: UGU
  alias Telebacon.Data.Updates.Update, as: UU
  alias Telebacon.Data.Response.SendMessage, as: RSM
  alias Telebacon.Data.Response.ForwardMessage, as: RFM
  alias Telebacon.Data.Response.SendPhoto, as: RSP
  alias Telebacon.Data.Response.SendAudio, as: RSA
  alias Telebacon.Data.Response.SendDocument, as: RSD
  alias Telebacon.Data.Response.SendSticker, as: RSS
  alias Telebacon.Data.Response.SendVideo, as: RSVI
  alias Telebacon.Data.Response.SendVoice, as: RSVO
  alias Telebacon.Data.Response.SendLocation, as: RSL
  alias Telebacon.Data.Response.SendVenue, as: RSVE
  alias Telebacon.Data.Response.SendContact, as: RSC
  alias Telebacon.Data.Response.SendChatAction, as: RSCA
  alias Telebacon.Data.API.Message, as: Message
  alias Telebacon.Data.API.User, as: User
  alias Telebacon.Data.API.UserProfilePhotos, as: UPP
  alias Telebacon.Data.API.GetUserProfilePhotos, as: GUPP
  alias Telebacon.Data.API.GetFile, as: GF
  alias Telebacon.Data.API.File, as: File
  alias Telebacon.Data.API.ChatMember, as: ChatMember
  alias Telebacon.Data.API.GetChat, as: GC
  alias Telebacon.Data.API.GetChatMember, as: GCM
  alias Telebacon.Data.API.GetChatMembersCount, as: GCMC
  alias Telebacon.Data.API.GetChatAdministrators, as: GCA
  alias Telebacon.Data.API.KickChatMember, as: KCM
  alias Telebacon.Data.API.LeaveChat, as: LC
  alias Telebacon.Data.API.UnbanChatMember, as: UCM
  alias Telebacon.Data.API.Chat, as: Chat


  @lint false
  def get_updates(key) do
    get_updates(key, %UGU{})
  end

  # Telegram API
  @spec get_updates(binary, %UGU{})
    :: {:ok, [%UU{}]}
    | {:failure, any}
  def get_updates(key, params) do
    {ty, response} = HTTP.call(key, "getUpdates", params)
    parse = &UU.fromMap(&1)
    handleResult(ty, response, &Enum.map(&1,parse))
  end

  Simple.call [:get, :me], User
  Simple.call [:get, :user, :profile, :photos], GUPP, UPP
  Simple.call [:get, :file], GF, File
  Simple.call [:get, :chat], GC, Chat
  Simple.call [:get, :chat, :administrators], GCA, [ChatMember]
  Simple.call [:get, :chat, :members, :count], GCMC, :integer
  Simple.call [:get, :chat, :member], GCM, ChatMember

  Simple.call [:send, :message], RSM, Message
  Simple.call [:forward, :message], RFM, Message
  Simple.call [:send, :photo], RSP, Message
  Simple.call [:send, :audio], RSA, Message
  Simple.call [:send, :document], RSD, Message
  Simple.call [:send, :sticker], RSS, Message
  Simple.call [:send, :video], RSVI, Message
  Simple.call [:send, :voice], RSVO, Message
  Simple.call [:send, :location], RSL, Message
  Simple.call [:send, :venue], RSVE, Message
  Simple.call [:send, :contact], RSC, Message
  Simple.call [:send, :chat, :action], RSCA, :bool
  Simple.call [:unban, :chat, :member], UCM, :bool
  Simple.call [:kick, :chat, :member], KCM, :bool
  Simple.call [:leave, :chat], LC, :bool

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
