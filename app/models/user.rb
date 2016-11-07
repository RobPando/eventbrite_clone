class User < ApplicationRecord
  has_many :events, through: :invitations
  has_many :invitations
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
