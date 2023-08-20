class User < ApplicationRecord
  has_secure_password
    has_many :reservations
  has_many :payments
  has_many :favorites
  has_many :ratings
  enum role: { regular: 'regular', admin: 'admin' }
end
