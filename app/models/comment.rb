class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 4}
  validates :commenter, presence: true, length: { minimum: 4}

  belongs_to :article
end
