class Group < ApplicationRecord
    has_many :group_memberships, dependent: :destroy
    has_many :active_relationships, class_name: "GroupMembership",
                                    foreign_key: "user_id",
                                    dependent: :destroy
    has_many :users, through: :group_memberships

    def subscribers
        users
    end

    def subscribed?(user)
        subscribers.include?(user)
    end
end
