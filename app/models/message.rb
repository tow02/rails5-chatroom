# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { MessageBroadcastJob.perform_later self }
end
