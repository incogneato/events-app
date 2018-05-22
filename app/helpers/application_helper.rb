module ApplicationHelper
  def grouped_options
    if @search.event_brand_id.present?
      brand_id = @search.event_brand_id
      {
        'Canada'        => Location.find_by_brand_and_countries(brand_id, ['CA']).map { |location| [location.domestic_city_state_country, location.id] },
        'United States' => Location.find_by_brand_and_countries(brand_id, ['US']).map { |location| [location.domestic_city_state_country, location.id] },
        'Great Britain' => Location.find_by_brand_and_countries(brand_id, ['GB']).map { |location| [location.pretty_location_name, location.id] },
        'Germany'       => Location.find_by_brand_and_countries(brand_id, ['DE']).map { |location| [location.pretty_location_name, location.id] }
      }
    end
  end
end
