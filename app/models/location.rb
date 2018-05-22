class Location < ApplicationRecord
  belongs_to :country
  has_many :events

  def domestic_city_state_country
    [city, state].join(', ')
  end

  def foreign_city_country
    [address, city].join(', ')
  end

  def pretty_location_name
    if ['GB', 'DE'].include?(country.name)
      foreign_city_country
    else
      domestic_city_state_country
    end
  end

  class << self
    def find_by_brand(brand_ids)
      find_by_sql([
        "SELECT DISTINCT locations.* from locations
        JOIN events on events.location_id = locations.id
        JOIN event_types on event_types.event_id = events.id
        WHERE (event_types.event_brand_id in (?) AND locations.id = events.location_id)
        ORDER BY city,state", brand_ids
      ])
    end

    def find_by_brand_and_countries(brand_ids, countries)
      find_by_sql([
        "SELECT DISTINCT locations.* from locations
        JOIN countries on locations.country_id = countries.id
        JOIN events on events.location_id = locations.id
        JOIN event_types on event_types.event_id = events.id
        WHERE (event_types.event_brand_id in (?) AND countries.name in (?))
        ORDER BY city,state", brand_ids, countries
      ])
    end
  end
end
