class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: 'only allows letters', on: :create }

  has_many :events
  has_many :venues
end
