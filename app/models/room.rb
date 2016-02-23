# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :user
  has_many :messages
end
