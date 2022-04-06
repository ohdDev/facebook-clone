class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.string :status, :default => "pending"
      t.timestamps
    end
  end
end
