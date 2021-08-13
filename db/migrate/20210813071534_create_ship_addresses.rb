class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :build_name
      t.string     :phone_number,  null: false
      t.references :purchases,     null: false, foreign_key: true
      t.timestamps
    end
  end
end