class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :post_privacy, :default => "public"
      t.string :friends_list_privacy, :default => "public"
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
