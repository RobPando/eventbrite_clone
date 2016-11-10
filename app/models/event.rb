class Event < ApplicationRecord
  has_many :guests, through: :invitations, source: :user
  belongs_to :creator, class_name: "User"
  has_many :invitations
  

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true

  def Event.upcoming_events
    self.where("date >= ?", Time.zone.now)
  end

  def Event.past_events
    self.where("date < ?", Time.zone.now)
  end

end
