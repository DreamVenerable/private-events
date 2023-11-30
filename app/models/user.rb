class User < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "creator_id", inverse_of: 'creator'
  has_many :attendances, foreign_key: "attendee_id", inverse_of: 'attendee'
  has_many :attended_events, through: :attendances

  def attending?(event)
    attendances.exists?(attended_event: event)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
