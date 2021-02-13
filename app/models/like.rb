class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, counter_cache: true

  validate user_id, presence: true
end
