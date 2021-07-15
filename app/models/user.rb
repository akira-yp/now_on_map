class User < ApplicationRecord
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { presence: true,
                    format: { with: VALID_EMAIL_REGEX}}

  has_many :events
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event
  has_many :comments, dependent: :destroy
  has_many :mylocations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google)

  THUMBNAIL_SIZE = [100, 100]
  mount_uploader :image, ImageUploader

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.guest
    find_or_create_by!(email:"guest@guest.com") do |user|
      user.name = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email:"guest_admin@guest.com") do |user|
      user.name = "guest_admin"
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(name: auth.info.name,
                      email: auth.info.email,
                      provider: auth.provider,
                      uid: auth.uid,
                      password: Devise.friendly_token[0,20],
                    )
    end
    user.save
    user
  end
end
