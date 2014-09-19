class SorceryExternal < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id, :null => false
      t.string :provider, :uid, :access_token, :null => false
      t.timestamps
    end

    add_index :authentications, :user_id
  end
end