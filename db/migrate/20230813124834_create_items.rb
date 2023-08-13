class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_desc
      t.integer :category_id
      t.integer :item_status_id 
      t.integer :delivery_charge_id 
      t.integer :shipping_origin_id
      t.integer :days_until_dispatch_id
      t.integer :mini_sell_price
      t.timestamps
    end
  end
end
