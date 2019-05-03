class Chatroom < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :messages, dependent: :destroy
	belongs_to :user
end
