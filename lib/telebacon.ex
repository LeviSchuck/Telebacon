defmodule Telebacon do

  @moduledoc """
  Telegram Bot API.

  To act on telegram messages, add a polling bot with the `Telegram.Adapter`
  behaviour.

  Add the following to your supervision tree in order to
  `worker(Telebacon.Poller, [key, adapter, config])`
  where key is the telegram key like "bot1234:AAHCYnS...",
  adapter is a tuple of the module and parameter, such as `{Telebacon.Demo, nil}`
  finally config can have some additional polling information:
  You can specify polling configuration such as:
  * `:limit`: number of messages to retrieve at most at a time.
    This is by default: 5
  * `:timeout`: number in seconds to wait for a new message.
    This is by default: 300 (5 minutes)

  Much of the API is exposed below with *snake_case* function mirroring
  documented camelCase API calls from Telegram.
  [https://core.telegram.org/bots/api]()
  """

  require Telebacon.SimpleAPI
  alias Telebacon.HTTP
  alias Telebacon.SimpleAPI, as: Simple
  alias Telebacon.Data.API, as: A
  alias Telebacon.Data.Request, as: RQ
  alias Telebacon.Data.Response, as: RS

  @type tel_key :: binary

  def get_updates(key), do: get_updates(key, %{})

  # Telegram API
  @doc """
  Although exposed, this is meant to be used internally by polling bots
  managed by this library.

  [https://core.telegram.org/bots/api#getme]()
  """
  Simple.call [:get, :updates], RQ.GetUpdates, [A.Update]

  @doc """
  Requests basic information about the bot.
  """
  Simple.call [:get, :me], nil, A.User

  @doc """
  Other API responses may contain `file_id` references. However to access these
  files from permanent storage, `get_file` must first be used to have Telegram
  provide access to the contents temporarily under a private access point.

  Refer to `download_file` for more.
  [https://core.telegram.org/bots/api#getfile]()
  """
  Simple.call [:get, :file], RQ.GetFile, A.File

  @doc """
  Gets information about an established chat that the bot is a member of.

  [https://core.telegram.org/bots/api#getchat]()
  """
  Simple.call [:get, :chat], RQ.GetChat, A.Chat

  @doc """
  Gets list of profile pictures for a user.

  [https://core.telegram.org/bots/api#getuserprofilephotos]()
  """
  Simple.call [:get, :user, :profile, :photos],
    RQ.GetUserProfilePhotos,
    A.UserProfilePhotos

  @doc """
  For group chats, use this to find who the administrators are for the given chat.

  [https://core.telegram.org/bots/api#getchatadministrators]()
  """
  Simple.call [:get, :chat, :administrators],
    RQ.GetChatAdministrators,
    [A.ChatMember]

  @doc """
  For group chats, use this to get the number of members in a chat.

  [https://core.telegram.org/bots/api#getchatmemberscount]()
  """
  Simple.call [:get, :chat, :members, :count],
    RQ.GetChatMembersCount,
    :integer

  @doc """
  Use this method to get information about a member of a chat.

  [https://core.telegram.org/bots/api#getchatmember]()
  """
  Simple.call [:get, :chat, :member],
    RQ.GetChatMember,
    A.ChatMember

  @doc """
  Use this method to send text messages.

  [https://core.telegram.org/bots/api#sendmessage]()
  """
  Simple.call [:send, :message], RS.SendMessage, A.Message

  @doc """
  Use this method to forward messages of any kind

  [https://core.telegram.org/bots/api#forwardmessage]()
  """
  Simple.call [:forward, :message], RS.ForwardMessage, A.Message

  @doc """
  Use this method to send photos.

  [https://core.telegram.org/bots/api#sendphoto]()
  """
  Simple.call [:send, :photo], RS.SendPhoto, A.Message

  @doc """
  Use this method to send audio files.

  Sending binaries is not yet supported.
  To upload new files, you may provide a URL to a supported file type.

  [https://core.telegram.org/bots/api#sendaudio]()
  """
  Simple.call [:send, :audio], RS.SendAudio, A.Message

  @doc """
  Use this method to send general files.

  Sending binaries is not yet supported.
  To upload new files, you may provide a URL to a supported file type.

  [https://core.telegram.org/bots/api#senddocument]()
  """
  Simple.call [:send, :document], RS.SendDocument, A.Message

  @doc """
  Use this method to send stickers.

  Sending binaries is not yet supported.
  Ideally you should provide a file_id for an existing sticker.

  [https://core.telegram.org/bots/api#sendsticker]()
  """
  Simple.call [:send, :sticker], RS.SendSticker, A.Message

  @doc """
  Use this method to send video files.

  Sending binaries is not yet supported.
  To upload new files, you may provide a URL to a supported mp4 video.

  [https://core.telegram.org/bots/api#sendvideo]()
  """
  Simple.call [:send, :video], RS.SendVideo, A.Message

  @doc """
  Use this method to send video files.

  Sending binaries is not yet supported.
  To upload new files, you may provide a URL to a supported OPUS encoded ogg audio.

  [https://core.telegram.org/bots/api#sendvoice]()
  """
  Simple.call [:send, :voice], RS.SendVoice, A.Message

  @doc """
  Use this method to send a point on a map.

  [https://core.telegram.org/bots/api#sendlocation]()
  """
  Simple.call [:send, :location], RS.SendLocation, A.Message

  @doc """
  Use this method to send information about a venue.

  [https://core.telegram.org/bots/api#sendvenue]()
  """
  Simple.call [:send, :venue], RS.SendVenue, A.Message

  @doc """
  Use this method to send phone contacts.

  [https://core.telegram.org/bots/api#sendcontact]()
  """
  Simple.call [:send, :contact], RS.SendContact, A.Message

  @doc """
  se this method when you need to tell the user that something is
  happening on the bot's side. The status is set for 5 seconds or
  less (when a message arrives from your bot, Telegram clients clear
  its typing status). Returns True on success.

  [https://core.telegram.org/bots/api#sendchataction]()
  """
  Simple.call [:send, :chat, :action], RS.SendChatAction, :bool

  @doc """
  For group chats, use this method to leave.

  [https://core.telegram.org/bots/api#leavechat]()
  """
  Simple.call [:leave, :chat], RQ.LeaveChat, :bool

  @doc """
  Use this method to edit text and game messages sent by the bot
  or via the bot (for inline bots). On success, if edited message
  is sent by the bot, the edited Message is returned,
  otherwise True is returned.

  [https://core.telegram.org/bots/api#editmessagetext]()
  """
  Simple.call [:edit, :message, :text],
    RS.EditMessageText, A.Message

  @doc """
  Use this method to edit only the reply markup of messages sent by
  the bot or via the bot (for inline bots). On success, if edited
  message is sent by the bot, the edited Message is returned,
  otherwise True is returned.

  [https://core.telegram.org/bots/api#editmessagereplymarkup]()
  """
  Simple.call [:edit, :message, :reply, :markup],
    RS.EditMessageReplyMarkup, A.Message

  @doc """
  Images, voice, and so on all have file references, but the contents of such files
  are not embedded in API responses.

  To access a file, you need the file_path provided by `get_file`.
  This will provide a URL endpoint on Telegram's servers which can then be downloaded
  within a short time.

  According to telegram documentation, downloads are maxed at 20MB for bots.

  This function will download a file to the temp directory with a unique file name.
  Downloading the same file_path multiple times may create duplicate files within
  the temp folder.
  It is up to you to clean up these files afterwards.
  ## Example
  ```
  > file_id = List.last(message.photo).file_id
  > {:ok, file_ref} = get_file(key, %{file_id: file_id})
  > file_path = download_file(key, file_ref.file_path)
  "/tmp/file_3.jpg-1490516347-22704-cqgwoh"
  ```
  """
  @spec download_file(tel_key, binary) :: binary
  def download_file(key, file_path) do
    url = "file/" <> key <> "/" <> file_path
    HTTP.download_url(url, file_path)
  end
end
