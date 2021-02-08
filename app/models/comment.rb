class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 4}
  
  belongs_to :user
  belongs_to :article

  def author?(target_user)
    target_user == user
  end
end
