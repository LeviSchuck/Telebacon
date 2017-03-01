defmodule Telebacon.Data.Response do
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
  end
  defmodule ForwardMessage do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :from_chat_id,
      :disable_notification,
      :message_id
    ]
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
  end
  defmodule SendChatAction do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :action
    ]
  end
  defmodule ForceReply do
    @derive [Poison.Encoder]
    defstruct [
      :force_reply,
      :selective
    ]
  end
  defmodule ReplyKeyboardMarkup do
    @derive [Poison.Encoder]
    defstruct [
      :keyboard,
      :resize_keyboard,
      :one_time_keyboard,
      :selective
    ]
  end
  defmodule KeyboardButton do
    @derive [Poison.Encoder]
    defstruct [
      :text,
      :request_contact,
      :request_location
    ]
  end
  defmodule ReplyKeyboardRemove do
    @derive [Poison.Encoder]
    defstruct [
      :remove_keyboard,
      :selective
    ]
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
  end
  defmodule EditMessageReplyMarkup do
    @derive [Poison.Encoder]
    defstruct [
      :chat_id,
      :message_id,
      :inline_message_id,
      :reply_markup
    ]
  end
end