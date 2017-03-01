defmodule Telebacon.Adapter do
  @type message :: Telebacon.Data.API.Message
  @type send_message :: Telebacon.Data.Response.SendMessage
  @type send_forward :: Telebacon.Data.Response.ForwardMessage
  @type send_photo :: Telebacon.Data.Response.SendPhoto
  @type send_audio :: Telebacon.Data.Response.SendAudio
  @type send_video :: Telebacon.Data.Response.SendVideo
  @type send_document :: Telebacon.Data.Response.SendDocument
  @type send_sticker :: Telebacon.Data.Response.SendSticker
  @type send_voice :: Telebacon.Data.Response.SendVoice
  @type send_location :: Telebacon.Data.Response.SendLocation
  @type send_venue :: Telebacon.Data.Response.SendVenue
  @type send_contact :: Telebacon.Data.Response.SendContact
  @type send_chat_action :: Telebacon.Data.Response.SendChatAction

  @type rep :: send_message | send_forward | send_photo | send_audio | send_video | send_document | send_sticker | send_voice | send_location | send_venue | send_contact | send_chat_action
  @type reply :: {:reply, [rep]}

  @type state :: any

  @callback chat_message(message, state) :: reply
  @callback chat_edited_message(message, state) :: reply
  @callback chat_channel_post(message, state) :: reply
  @callback chat_edited_channel_post(message, state) :: reply
  # Inline and callback not supported.
end