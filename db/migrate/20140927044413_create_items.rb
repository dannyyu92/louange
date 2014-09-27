class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :status
      t.text :description
      t.float :average_price
      t.references :user
      t.timestamps
    end
  end
end
