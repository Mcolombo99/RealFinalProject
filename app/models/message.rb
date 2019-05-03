class Message < ApplicationRecord
  belongs_to :chatroom
  def created_at_formatted
    created_at.in_time_zone('EST').strftime('%b %e, %Y at %l:%M%p')
  end
end
