# 3 John 1:2
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :guests, through: :invitations, source: :user
  has_many :invitations

  validates :name, :description, :location, :creator, :date, presence: true

  def self.upcoming_events
    where('date >= ?', Time.zone.now)
  end

  def self.past_events
    where('date < ?', Time.zone.now)
  end
end
