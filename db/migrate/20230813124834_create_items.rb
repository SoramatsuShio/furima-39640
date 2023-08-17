class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_desc, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :shipping_origin_id, null: false
      t.integer :days_until_dispatch_id, null: false
      t.integer :mini_sell_price, null: false
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
