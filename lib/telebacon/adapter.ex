defmodule Telebacon.Adapter do
  @moduledoc "Adapter behaviour for a stateless bot"
  @type message :: Telebacon.Data.API.Message

  @type rep :: %Telebacon.Data.Response.SendMessage{}
    | %Telebacon.Data.Response.ForwardMessage{}
    | %Telebacon.Data.Response.SendPhoto{}
    | %Telebacon.Data.Response.SendAudio{}
    | %Telebacon.Data.Response.SendVideo{}
    | %Telebacon.Data.Response.SendDocument{}
    | %Telebacon.Data.Response.SendSticker{}
    | %Telebacon.Data.Response.SendVoice{}
    | %Telebacon.Data.Response.SendLocation{}
    | %Telebacon.Data.Response.SendVenue{}
    | %Telebacon.Data.Response.SendContact{}
    | %Telebacon.Data.Response.SendChatAction{}
  @type reply :: {:reply, [rep]}

  @type state :: any

  @callback chat_message(message, state) :: reply
  @callback chat_edited_message(message, state) :: reply
  @callback chat_channel_post(message, state) :: reply
  @callback chat_edited_channel_post(message, state) :: reply
  # Inline and callback not supported.
end
