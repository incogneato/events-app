class CreateEventTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_types do |t|
      t.integer :event_id
      t.integer :event_brand_id

      t.timestamps
    end
  end
end
