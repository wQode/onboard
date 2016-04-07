# == Schema Information
#
# Table name: notes
#
#  id                :integer          not null, primary key
#  title             :string
#  content           :text
#  user_id           :integer
#  classification_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Note < ActiveRecord::Base
  belongs_to :creator, :class_name =>'User', :foreign_key => 'user_id'
  has_and_belongs_to_many :users
  
  validates :title, :presence => true
end
