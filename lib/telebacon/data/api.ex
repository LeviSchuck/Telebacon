defmodule Telebacon.Data.API do
  defmodule User do
    @derive [Poison.Encoder]
    defstruct [
      :id,
      :first_name,
      :last_name,
      :username
    ]
    @type t :: %User{id: integer, first_name: String.t, last_name: String.t | nil, username: String.t | nil}
  end
  defmodule ChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :user,
      :status
    ]
  end
  defmodule ResponseParameters do
    @derive [Poison.Encoder]
    defstruct [
      :migrate_to_chat_id,
      :retry_after
    ]
  end
  
  defmodule GetUserProfilePhotos do
    @derive [Poison.Encoder]
    defstruct [
      :user_id,
      :offset,
      :limit
    ]
  end
  defmodule GetFile do
    @derive [Poison.Encoder]
    defstruct [
      :file_id
    ]
  end
  defmodule KickChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
  end
  defmodule LeaveChat do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
  end
  defmodule UnbanChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
  end
  defmodule GetChat do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
  end
  defmodule GetChatAdministrators do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
  end
  defmodule GetChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
  end
  defmodule MessageEntity do
    @derive [Poison.Encoder]
    defstruct [
      :type,
      :offset,
      :length,
      :url,
      :user
    ]
  end
  defmodule PhotoSize do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :width,
      :height,
      :file_size
    ]
  end
  defmodule Audio do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :duration,
      :performer,
      :title,
      :mime_type,
      :file_size
    ]
  end
  defmodule Document do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :thumb,
      :file_name,
      :mime_type,
      :file_size
    ]
  end
  defmodule Sticker do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :width,
      :height,
      :thumb,
      :emoji,
      :file_size
    ]
  end
  defmodule Video do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :width,
      :height,
      :duration,
      :thumb,
      :mime_type,
      :file_size
    ]
  end
  defmodule Voice do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :duration,
      :mime_type,
      :file_size
    ]
  end
  defmodule Contact do
    @derive [Poison.Encoder]
    defstruct [
      :phone_number,
      :first_name,
      :last_name,
      :user_id
    ]
  end
  defmodule Location do
    @derive [Poison.Encoder]
    defstruct [
      :longitude,
      :latitude
    ]
  end
  defmodule Venue do
    @derive [Poison.Encoder]
    defstruct [
      :location,
      :title,
      :address,
      :foursquare_id
    ]
  end
  defmodule UserProfilePhotos do
    @derive [Poison.Encoder]
    defstruct [
      :total_count,
      :photos
    ]
  end
  defmodule File do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :file_size,
      :file_path
    ]
  end
  defmodule Message do
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
  end
end