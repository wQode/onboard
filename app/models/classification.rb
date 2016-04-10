# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime
#  updated_at :datetime
#

class Classification < ActiveRecord::Base
  belongs_to :user
  has_many :documents
end
