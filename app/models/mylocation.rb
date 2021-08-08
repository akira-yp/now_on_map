class Mylocation < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :my_latitude
    validates :my_longitude
  end
end
