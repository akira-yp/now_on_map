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

  after_create do
    event = Event.find_by(id: self.id)
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    event.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('/[#＃]/'))
      event.hashtags << tag
    end

  end

  before_update do
    event = Event.find_by(id: self.id)
    event.hashtags.clear
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('/[#＃]/'))
      event.hashtags << tag
    end
  end
end
