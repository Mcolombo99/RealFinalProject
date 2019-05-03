class UsersChatroom < ApplicationRecord
  validates :user, uniqueness: { scope: :chatroom }
  belongs_to :chatroom
  belongs_to :user
end