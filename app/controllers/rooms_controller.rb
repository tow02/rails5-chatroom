class RoomsController < ApplicationController
  def show
    @messages = Message.all
    gon.user_id = current_user.id
  end
end
