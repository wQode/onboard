# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  avatar          :string
#  password_digest :string
#  email           :string
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
#   has_secure_password

# # Checks, validates username
#   validates :username, :presence => true, :length => { :minimum => 3 }
end
