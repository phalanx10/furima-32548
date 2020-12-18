class CreateDestinationAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :destination_addresses do |t|
      t.string :post_code,           null: false
      t.integer :prefecture,          null: false
      t.string :city,                null: false
      t.string :address,             null: false
      t.string :phone_number,        null: false
      t.string :building_name
      t.references :purchase_record,  foreign_key: true
      t.timestamps
    end
  end
end
