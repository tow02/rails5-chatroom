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

require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rooms_show_url
    assert_response :success
  end

end
