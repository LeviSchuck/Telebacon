defmodule Telebacon.Data.Response do
  defmodule ForceReply do
    @derive [Poison.Encoder]
    defstruct [
      :force_reply,
      :selective
    ]
    @type t :: %ForceReply{
      force_reply: boolean,
      selective: boolean | nil
    }
  end
  defmodule KeyboardButton do
    @derive [Poison.Encoder]
    defstruct [
      :text,
      :request_contact,
      :request_location
    ]
    @type t :: %KeyboardButton{
      text: String.t,
      request_contact: boolean | nil,
      request_location: boolean | nil
    }
  end
  defmodule ReplyKeyboardMarkup do
    @derive [Poison.Encoder]
    defstruct [
      :keyboard,
      :resize_keyboard,
      :one_time_keyboard,
      :selective
    ]
    @type t :: %ReplyKeyboardMarkup{
      keyboard: [[%KeyboardButton{}]],
      resize_keyboard: boolean | nil,
      one_time_keyboard: boolean | nil,
      selective: boolean | nil
    }
  end
  defmodule ReplyKeyboardRemove do
    @derive [Poison.Encoder]
    defstruct [
      :remove_keyboard,
      :selective
    ]
    @type t :: %ReplyKeyboardRemove{
      remove_keyboard: boolean,
      selective: boolean | nil
    }
  end
  defmodule SendMessage do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :text,
      :parse_mode,
      :disable_web_page_preview,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup,
    ]
    @type t :: %SendMessage{
      chat_id: integer | String.t,
      text: String.t,
      parse_mode: String.t | nil,
      disable_web_page_preview: boolean | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule ForwardMessage do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :from_chat_id,
      :disable_notification,
      :message_id
    ]
    @type t :: %ForwardMessage{
      chat_id: integer | String.t,
      from_chat_id: integer | String.t,
      disable_notification: boolean | nil,
      message_id: integer
    }
  end
  defmodule SendPhoto do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :photo,
      :caption,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup 
    ]
    @type t :: %SendPhoto{
      chat_id: integer | String.t,
      photo: String.t | binary,
      caption: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendAudio do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :audio,
      :caption,
      :duration,
      :performer,
      :title,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendAudio{
      chat_id: integer | String.t,
      audio: String.t | binary,
      caption: String.t | nil,
      duration: integer | nil,
      performer: String.t | nil,
      title: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendDocument do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :document,
      :caption,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendDocument{
      chat_id: integer | String.t,
      document: String.t | binary,
      caption: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendSticker do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :sticker,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendSticker{
      chat_id: integer | String.t,
      sticker: String.t | binary,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendVideo do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :video,
      :duration,
      :width,
      :height,
      :caption,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendVideo{
      chat_id: integer | String.t,
      video: String.t | binary,
      duration: integer | nil,
      width: integer | nil,
      height: integer | nil,
      caption: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendVoice do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :voice,
      :duration,
      :caption,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendVoice{
      chat_id: integer | String.t,
      voice: String.t | binary,
      duration: integer | nil,
      caption: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendLocation do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :lattitude,
      :longitude,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendLocation{
      chat_id: integer | String.t,
      lattitude: float,
      longitude: float,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendVenue do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :lattitude,
      :longitude,
      :title,
      :address,
      :foursquare_id,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendVenue{
      chat_id: integer | String.t,
      lattitude: float,
      longitude: float,
      title: String.t,
      address: String.t,
      foursquare_id: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendContact do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :phone_number,
      :first_name,
      :last_name,
      :disable_notification,
      :reply_to_message_id,
      :reply_markup
    ]
    @type t :: %SendContact{
      chat_id: integer | String.t,
      phone_number: String.t,
      first_name: String.t,
      last_name: String.t | nil,
      disable_notification: boolean | nil,
      reply_to_message_id: integer | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule SendChatAction do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :action
    ]
    @type t :: %SendChatAction{
      chat_id: integer | String.t,
      action: String.t
    }
  end
  defmodule EditMessageText do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :message_id,
      :inline_message_id,
      :text,
      :parse_mode,
      :disable_web_page_preview,
      :reply_markup
    ]
    @type t :: %EditMessageText{
      chat_id: integer | String.t,
      message_id: integer | nil,
      inline_message_id: String.t | nil,
      text: String.t,
      parse_mode: String.t | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule EditMessageCaption do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :message_id,
      :inline_message_id,
      :caption,
      :reply_markup
    ]
    @type t :: %EditMessageCaption{
      chat_id: integer | String.t,
      message_id: integer | nil,
      inline_message_id: String.t | nil,
      caption: String.t | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
  defmodule EditMessageReplyMarkup do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :message_id,
      :inline_message_id,
      :reply_markup
    ]
    @type t :: %EditMessageReplyMarkup{
      chat_id: integer | String.t,
      message_id: integer | nil,
      inline_message_id: String.t | nil,
      reply_markup: %ReplyKeyboardMarkup{} | %ReplyKeyboardRemove{} | %ForceReply{} | %{} | nil
    }
  end
end