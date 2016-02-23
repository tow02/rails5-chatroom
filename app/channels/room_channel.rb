# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def subscribed(data)
    stream_from "room_channel_#{data['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def speak(data)
    # ActionCable.server.broadcast "room_channel", message: data['message']
    Message.create! content: data['message'], user_id: data['user_id'], room_id: data['room_id']
  end
end
