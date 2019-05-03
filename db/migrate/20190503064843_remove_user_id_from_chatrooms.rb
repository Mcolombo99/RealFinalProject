class RemoveUserIdFromChatrooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :chatrooms, :user_id, :integer
  end
end
