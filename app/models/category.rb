class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categorizings, dependent: :destroy
  has_many :categorized_events, through: :categorizings, source: :event

  mount_uploader :icon, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[id]
  end
end
