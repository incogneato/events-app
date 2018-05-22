class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :weekend_name
      t.string :year
      t.date     :adjusted_start
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.integer :event_market_id
      t.integer :location_id

      t.timestamps
    end
  end
end
