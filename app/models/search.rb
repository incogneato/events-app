class Search < ApplicationRecord

  def locations
    @locations ||= find_location
  end

  def events
    if brand_and_location_set?
      @events = filter_events_by_brand_and_location
    else
      @events = filter_events_by_brand
    end
  end

  def event_brand
    @event_brand ||= find_event_brand if event_brand_id
  end

  private

  def brand_and_location_set?
    location_id.present? && event_brand_id.present?
  end

  def find_location
    if brand_and_location_set?
      @_locations ||= filter_events_by_brand_and_location
    else
      @_locations ||= Location.find_by_brand(event_brand_id)
    end
  end

  def find_event_brand
    @_event_brand ||= EventBrand.includes(:events).find(event_brand_id)
  end

  def filter_events_by_brand
    brands = EventBrand.includes(:events).find(event_brand_id)
    @_events ||= brands.events.uniq.sort_by { |event| event.name }
  end

  def filter_events_by_brand_and_location
    @_events ||= Event.find_by_brand_and_location(event_brand_id, location_id)
  end
end
