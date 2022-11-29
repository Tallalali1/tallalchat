class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: true
  has_many :messages, dependent: :destroy
  has_secure_password
end
