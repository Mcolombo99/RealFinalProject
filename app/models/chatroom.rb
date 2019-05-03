class Chatroom < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :messages, dependent: :destroy
	has_many :users_chatroom, dependent: :destroy
    has_many :users, through: :users_chatroom
end
