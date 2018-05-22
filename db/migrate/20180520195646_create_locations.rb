class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :venue_name
      t.string :address
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :country_id

      t.timestamps
    end
  end
end
