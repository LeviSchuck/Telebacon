defmodule Telebacon.Data.API do
  defmodule User do
    @derive [Poison.Encoder]
    defstruct [
      :id,
      :first_name,
      :last_name,
      :username
    ]
    @type t :: %User{
      id: integer,
      first_name: String.t,
      last_name: String.t | nil,
      username: String.t | nil
    }
  end
  defmodule Chat do
    @derive [Poison.Encoder]
    defstruct [
      :id,
      :type,
      :title,
      :username,
      :first_name,
      :last_name,
      :all_members_are_administrators
    ]
    @type t :: %Chat{
      id: integer,
      type: String.t,
      title: String.t | nil,
      username: String.t | nil,
      first_name: String.t | nil,
      last_name: String.t | nil,
      all_members_are_administrators: boolean | nil
    }
  end
  defmodule ChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :user,
      :status
    ]
    @type t :: %ChatMember{
      user: %User{},
      status: String.t
    }
  end
  defmodule ResponseParameters do
    @derive [Poison.Encoder]
    defstruct [
      :migrate_to_chat_id,
      :retry_after
    ]
    @type t :: %ResponseParameters{
      migrate_to_chat_id: integer | nil,
      retry_after: integer | nil
    }
  end
  
  defmodule GetUserProfilePhotos do
    @derive [Poison.Encoder]
    defstruct [
      :user_id,
      :offset,
      :limit
    ]
    @type t :: %GetUserProfilePhotos{
      user_id: integer,
      offset: integer | nil,
      limit: integer | nil
    }
  end
  defmodule GetFile do
    @derive [Poison.Encoder]
    defstruct [
      :file_id
    ]
    @type t :: %GetFile{
      file_id: String.t
    }
  end
  defmodule KickChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
    @type t :: %KickChatMember{
      chat_id: integer | String.t,
      user_id: integer
    }
  end
  defmodule LeaveChat do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
    @type t :: %KickChatMember{
      chat_id: integer | String.t
    }
  end
  defmodule UnbanChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
    @type t :: %UnbanChatMember{
      chat_id: integer | String.t,
      user_id: integer
    }
  end
  defmodule GetChat do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
    @type t :: %GetChat{
      chat_id: integer | String.t
    }
  end
  defmodule GetChatAdministrators do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id
    ]
    @type t :: %GetChatAdministrators{
      chat_id: integer | String.t
    }
  end
  defmodule GetChatMember do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :user_id
    ]
    @type t :: %GetChatMember{
      chat_id: integer | String.t,
      user_id: integer
    }
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
    @type t :: %MessageEntity{
      type: String.t,
      offset: integer | nil,
      length: integer | nil,
      url: String.t | nil,
      user: %User{} | nil
    }
  end
  defmodule PhotoSize do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :width,
      :height,
      :file_size
    ]
    @type t :: %PhotoSize{
      file_id: String.t,
      width: integer,
      height: integer,
      file_size: integer | nil
    }
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
    @type t :: %Audio{
      file_id: String.t,
      duration: integer,
      performer: String.t | nil,
      title: String.t | nil,
      mime_type: String.t | nil,
      file_size: integer | nil
    }
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
    @type t :: %Document{
      file_id: String.t,
      thumb: %PhotoSize{} | nil,
      file_name: String.t | nil,
      mime_type: String.t | nil,
      file_size: integer | nil
    }
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
    @type t :: %Sticker{
      file_id: String.t,
      width: integer,
      height: integer,
      thumb: %PhotoSize{} | nil,
      emoji: String.t | nil,
      file_size: integer | nil
    }
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
    @type t :: %Video{
      file_id: String.t,
      width: integer,
      height: integer,
      duration: integer,
      thumb: %PhotoSize{} | nil,
      mime_type: String.t | nil,
      file_size: integer | nil
    }
  end
  defmodule Voice do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :duration,
      :mime_type,
      :file_size
    ]
    @type t :: %Voice{
      file_id: String.t,
      duration: integer,
      mime_type: String.t | nil,
      file_size: integer | nil
    }
  end
  defmodule Contact do
    @derive [Poison.Encoder]
    defstruct [
      :phone_number,
      :first_name,
      :last_name,
      :user_id
    ]
    @type t :: %Contact{
      phone_number: String.t,
      first_name: String.t,
      last_name: String.t | nil,
      user_id: integer | nil
    }
  end
  defmodule Location do
    @derive [Poison.Encoder]
    defstruct [
      :longitude,
      :latitude
    ]
    @type t :: %Location{
      longitude: float,
      latitude: float
    }
  end
  defmodule Venue do
    @derive [Poison.Encoder]
    defstruct [
      :location,
      :title,
      :address,
      :foursquare_id
    ]
    @type t :: %Venue{
      location: %Location{},
      title: String.t,
      address: String.t,
      foursquare_id: String.t | nil
    }
  end
  defmodule UserProfilePhotos do
    @derive [Poison.Encoder]
    defstruct [
      :total_count,
      :photos
    ]
    @type t :: %UserProfilePhotos{
      total_count: integer,
      photos: [%PhotoSize{}]
    }
  end
  defmodule File do
    @derive [Poison.Encoder]
    defstruct [
      :file_id,
      :file_size,
      :file_path
    ]
    @type t :: %File{
      file_id: String.t,
      file_size: integer | nil,
      file_path: String.t | nil
    }
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
  end
end