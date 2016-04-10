# == Schema Information
#
# Table name: revisions
#
#  id                :integer          not null, primary key
#  document_id       :integer
#  classification_id :integer
#  user_id           :integer
#  title             :string
#  content           :text
#  created_at        :datetime
#  updated_at        :datetime
#

class Revision < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
end
