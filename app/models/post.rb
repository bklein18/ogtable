class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }
end
