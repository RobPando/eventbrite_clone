class Event < ApplicationRecord
  has_many :guests, through: :invitations, source: :user
  belongs_to :creator, class_name: "User"
  has_many :invitations

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true
  validates :date, presence: true

  def self.upcoming_events
    where("date >= ?", Time.zone.now)
  end

  def self.past_events
    where("date < ?", Time.zone.now)
  end
end
