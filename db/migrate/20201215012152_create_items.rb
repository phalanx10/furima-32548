class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,     null: false
      t.text    :description,   null: false
      t.integer :price,         null: false
      t.integer :status,        null: false
      t.integer :delivery_days, null: false
      t.integer :Shipping_area, null: false
      t.integer :delivery_fee,  null: false
      t.integer :categories,    null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
