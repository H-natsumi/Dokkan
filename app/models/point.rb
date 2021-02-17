class Point < ApplicationRecord
  validates :battle_id, uniqueness: { scope: :user_id }
end
