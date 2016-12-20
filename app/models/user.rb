# bcrypt
class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :events, through: :invitations, source: :event
  has_many :invitations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
