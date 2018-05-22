class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches, id: :uuid do |t|
      t.integer :event_brand_id
      t.integer :location_id
      t.timestamps
    end
  end
end
