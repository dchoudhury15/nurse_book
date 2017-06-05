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
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#  profile_picture        :string
#  headline               :text
#  education              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_requests, :class_name => "Connection", :foreign_key => "sender_id", :dependent => :destroy
  has_many :received_requests, :class_name => "Connection", :foreign_key => "receiver_id", :dependent => :destroy
  has_many :sent_messages, :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy
  has_many :received_messages, :class_name => "Message", :foreign_key => "receiver_id", :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_many :friends_where_sender, :through => :sent_requests, :source => :receiver
  has_many :friends_where_receiver, :through => :received_requests, :source => :sender
  has_many :timeline_posts, :through => :friends_where_sender, :source => :posts
  has_many :message_where_senders, :through => :sent_messages, :source => :receiver
  has_many :message_where_receivers, :through => :received_messages, :source => :sender

  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => true }
  validates :profile_picture, :presence => true
  
end
