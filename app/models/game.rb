class Game < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  acts_as_votable
end
