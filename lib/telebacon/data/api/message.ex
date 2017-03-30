defmodule Telebacon.Data.API.Message do
  @moduledoc "Message data type for Telegram"
  alias Poison.Decode, as: PD
  alias Telebacon.Data.Helper, as: H
  alias Telebacon.Data.API.User
  alias Telebacon.Data.API.Chat
  alias Telebacon.Data.API.Audio
  alias Telebacon.Data.API.Voice
  alias Telebacon.Data.API.Video
  alias Telebacon.Data.API.Location
  alias Telebacon.Data.API.Document
  alias Telebacon.Data.API.Venue
  alias Telebacon.Data.API.Sticker
  alias Telebacon.Data.API.PhotoSize
  alias Telebacon.Data.API.MessageEntity
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
  @type t :: %__MODULE__{
    message_id: integer,
    from: User.t | nil,
    date: integer,
    chat: Chat.t,
    forward_from: User.t | nil,
    forward_from_chat: Chat.t | nil,
    forward_from_message_id: integer | nil,
    forward_date: integer | nil,
    reply_to_message: t | nil,
    edit_date: integer | nil,
    text: String.t | nil,
    entities: [MessageEntity.t] | nil,
    audio: Audio.t | nil,
    document: Document.t | nil,
    game: %{} | nil,
    photo: [PhotoSize.t] | nil,
    sticker: Sticker.t | nil,
    video: Video.t | nil,
    voice: Voice.t | nil,
    caption: String.t | nil,
    location: Location.t | nil,
    venue: Venue.t | nil,
    new_chat_member: User.t | nil,
    left_chat_member: User.t | nil,
    new_chat_title: String.t | nil,
    new_chat_photo: [] | nil,
    delete_chat_photo: boolean | nil,
    group_chat_created: boolean | nil,
    supergroup_chat_created: boolean | nil,
    channel_chat_created: boolean | nil,
    migrate_to_chat_id: integer | nil,
    migrate_from_chat_id: integer | nil,
    pinned_message: t | nil
  }

  @spec from_map(%{}) :: t
  def from_map(map) do
    val = PD.decode(map, as: %__MODULE__{})
    full_val = val
      |> H.from_map(:reply_to_message, Message)
      |> H.from_map(:pinned_message, Message)
      |> H.from_map(:from, User)
      |> H.from_map(:forward_from, User)
      |> H.from_map(:new_chat_member, User)
      |> H.from_map(:left_chat_member, User)
      |> H.from_map(:chat, Chat)
      |> H.from_map(:forward_from_chat, Chat)
      |> H.from_map_list(:entities, MessageEntity)
      |> H.from_map(:audio, Audio)
      |> H.from_map(:document, Document)
      |> H.from_map_list(:photo, PhotoSize)
      |> H.from_map(:sticker, Sticker)
      |> H.from_map(:video, Video)
      |> H.from_map(:voice, Voice)
      |> H.from_map(:location, Location)
      |> H.from_map(:venue, Venue)
    full_val
  end

  use Telebacon.Data.Inspect
end
