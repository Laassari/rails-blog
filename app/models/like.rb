class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, counter_cache: true

  validates :user_id, presence: true
end
