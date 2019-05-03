class CreateUsersChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :users_chatrooms do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
    end
  end
end
