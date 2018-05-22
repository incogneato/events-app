class Event < ApplicationRecord
  belongs_to :event_market
  belongs_to :location
  has_many :event_types
  has_many :event_brands, through: :event_types

  def self.find_by_brand_and_location(brand_id, location_id)
    find_by_sql([
     "SELECT DISTINCT events.* from events
      JOIN locations on locations.id = events.location_id
      JOIN event_types on event_types.event_id = events.id
      JOIN event_brands on event_types.event_brand_id = event_brands.id
      WHERE (event_types.event_brand_id = ? AND locations.id = ?)", brand_id, location_id
    ])
  end
end
