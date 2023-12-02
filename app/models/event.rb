class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :attendances, foreign_key: "attended_event_id", inverse_of: 'attended_event', dependent: :destroy
  has_many :attendees, through: :attendances, dependent: :destroy

  scope :past, -> { where(event_datetime: ..(Time.now)) }
  scope :upcoming, -> { where(event_datetime: (Time.now)..) }
end
