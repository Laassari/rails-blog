class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true

  def already_liked?(resource)
    return false unless resource.respond_to? :likes
    return false unless self.present?

    resource.likes.exists?('user_id': id)
  end

  def like(resource)
    return false unless resource.respond_to? :likes
    return false unless self.present?

    resource.likes.where('user_id': id).first
  end
end
