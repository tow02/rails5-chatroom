App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connected called")
    setTimeout =>
      @followCurrentRoom()
      @installPageChangeCallback()
    , 1000

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    # make page automatically scroll down
    # when the new message appears in the page
    $(window).scrollTop($(document).height());
    # Called when there's incoming data on the websocket for this channel

  followCurrentRoom: ->
    roomId = gon.room_id
    if roomId
      @perform 'subscribed', room_id: roomId
    else
      @perform 'unsubscribed'

  speak: (message) ->
    @perform 'speak', message: message, user_id: gon.user_id, room_id: gon.room_id

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.room.followCurrentRoom()

$(document).on 'keypress', '#chat-speak', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ""
    event.preventDefault()
    # make page automatically scroll down
    # when the new message appears in the page
    $(window).scrollTop($(document).height());
