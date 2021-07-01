class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :user
  has_many :categorizings, dependent: :destroy
  has_many :categories, through: :categorizings, source: :category
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :hashtagings
  has_many :hashtags, through: :hashtagings, source: :hashtag

  mount_uploader :image, ImageUploader
end
