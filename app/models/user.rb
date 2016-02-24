# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :text
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  validates :username, uniqueness: true
  before_save { self.username = username.downcase }
  has_attached_file :avatar, styles: { thumb: "100x100>" }, :default_url => "/images/:style/default-avatar.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
