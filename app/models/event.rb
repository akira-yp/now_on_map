class Event < ApplicationRecord
  belongs_to :user
  has_many :categorizings, dependent: :destroy
  has_many :categories, through: :categorizings, source: :category
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :hashtagings, dependent: :destroy
  has_many :hashtags, through: :hashtagings, source: :hashtag

  with_options presence: true do
    validates :title
    validates :description
    validates :start_date
    validates :end_date
    validates :location
    validates :latitude
    validates :longitude
    validates :categories
  end

  validate :start_end_check

  THUMBNAIL_SIZE = [400, 400]
  mount_uploader :image, ImageUploader

  def start_end_check
    if self.start_date && self.end_date
      errors.add(:end_date, "は開始日より後になるよう設定してください") if self.start_date > self.end_date
    end
  end

  after_create do
    event = Event.find_by(id: self.id)
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    event.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.delete('/[#＃]/'))
      event.hashtags << tag
    end

  end

  before_update do
    event = Event.find_by(id: self.id)
    event.hashtags.clear
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.delete('/[#＃]/'))
      event.hashtags << tag
    end
  end
end
