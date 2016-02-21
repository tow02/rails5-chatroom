class RoomsController < ApplicationController
  before_action :authenticate_user!

  def show
    @messages = Message.all
    gon.user_id = current_user.id
  end
end
