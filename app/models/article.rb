class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_many :likes, as: :likeable

  validates :title, presence: true, length: { minimum: 4}
  validates :text, presence: true, length: { minimum: 4}

  def author?(target_user)
    target_user == user
  end
end
