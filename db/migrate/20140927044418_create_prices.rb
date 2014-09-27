class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :amount
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end
