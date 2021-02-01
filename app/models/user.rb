class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true
end
