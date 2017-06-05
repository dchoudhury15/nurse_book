# == Schema Information
#
# Table name: connections
#
#  id               :integer          not null, primary key
#  sender_id        :integer
#  receiver_id      :integer
#  request_accepted :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Connection < ApplicationRecord
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  validates :sender, :presence => true
  validates :sender, :uniqueness => { :scope => [:receiver] }
  validates :receiver, :presence => true
end
