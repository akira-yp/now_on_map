class Hashtag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255}
  has_many :hashtagings
  has_many :events, through: :hashtagings, source: :event
end
