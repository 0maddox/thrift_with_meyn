class ClothingItem < ApplicationRecord
  belongs_to :category
  has_many :reservations
  has_many :payments
  has_many :ratings
  has_many :favorites
end
