class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :clothing_item
end
