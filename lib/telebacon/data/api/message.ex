defmodule Telebacon.Data.API.Message do
  @moduledoc "Message data type for Telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.User, as: User
  alias Telebacon.Data.API.Chat, as: Chat
  alias Telebacon.Data.API.Audio, as: Audio
  alias Telebacon.Data.API.Voice, as: Voice
  alias Telebacon.Data.API.Video, as: Video
  alias Telebacon.Data.API.Location, as: Location
  alias Telebacon.Data.API.Document, as: Document
  alias Telebacon.Data.API.Venue, as: Venue
  alias Telebacon.Data.API.Sticker, as: Sticker
  alias Telebacon.Data.API.Message, as: Message
  alias Telebacon.Data.API.PhotoSize, as: PhotoSize
  alias Telebacon.Data.API.MessageEntity, as: MessageEntity
  @derive [Poison.Encoder]
  defstruct [
    :message_id,
    :from,
    :date,
    :chat,
    :forward_from,
    :forward_from_chat,
    :forward_from_message_id,
    :forward_date,
    :reply_to_message,
    :edit_date,
    :text,
    :entities,
    :audio,
    :document,
    :game,
    :photo,
    :sticker,
    :video,
    :voice,
    :caption,
    :location,
    :venue,
    :new_chat_member,
    :left_chat_member,
    :new_chat_title,
    :new_chat_photo,
    :delete_chat_photo,
    :group_chat_created,
    :supergroup_chat_created,
    :channel_chat_created,
    :migrate_to_chat_id,
    :migrate_from_chat_id,
    :pinned_message
  ]
  @type t :: %Message{
    message_id: integer,
    from: %User{} | nil,
    date: integer,
    chat: %Chat{},
    forward_from: %User{} | nil,
    forward_from_chat: %Chat{} | nil,
    forward_from_message_id: integer | nil,
    forward_date: integer | nil,
    reply_to_message: %Message{} | nil,
    edit_date: integer | nil,
    text: String.t,
    entities: [%MessageEntity{}] | nil,
    audio: %Audio{} | nil,
    document: %Document{} | nil,
    game: %{} | nil,
    photo: [%PhotoSize{}] | nil,
    sticker: %Sticker{} | nil,
    video: %Video{} | nil,
    voice: %Voice{} | nil,
    caption: String.t | nil,
    location: %Location{} | nil,
    venue: %Venue{} | nil,
    new_chat_member: %User{} | nil,
    left_chat_member: %User{} | nil,
    new_chat_title: String.t | nil,
    new_chat_photo: [] | nil,
    delete_chat_photo: boolean | nil,
    group_chat_created: boolean | nil,
    supergroup_chat_created: boolean | nil,
    channel_chat_created: boolean | nil,
    migrate_to_chat_id: integer | nil,
    migrate_from_chat_id: integer | nil,
    pinned_message: %Message{} | nil
  }

  @spec fromMap(%{}) :: %Message{}
  def fromMap(map) do
    val = PD.decode(map, as: %Message{})
    full_val = val
      |> H.fromMap(:reply_to_message, Message)
      |> H.fromMap(:pinned_message, Message)
      |> H.fromMap(:from, User)
      |> H.fromMap(:forward_from, User)
      |> H.fromMap(:new_chat_member, User)
      |> H.fromMap(:left_chat_member, User)
      |> H.fromMap(:chat, Chat)
      |> H.fromMap(:forward_from_chat, Chat)
      |> H.fromMapList(:entities, MessageEntity)
      |> H.fromMap(:audio, Audio)
      |> H.fromMap(:document, Document)
      |> H.fromMapList(:photo, PhotoSize)
      |> H.fromMap(:sticker, Sticker)
      |> H.fromMap(:video, Video)
      |> H.fromMap(:voice, Voice)
      |> H.fromMap(:location, Location)
      |> H.fromMap(:venue, Venue)
    full_val
  end

  use Telebacon.Data.Inspect
end
