class CreateEventMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :event_markets do |t|
      t.string :name

      t.timestamps
    end
  end
end
