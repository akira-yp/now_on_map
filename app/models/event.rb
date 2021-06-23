class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
