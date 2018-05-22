require 'csv'

[
  ['TM5K','Tough Mudder 5K'],
  ['TMH', 'Tough Mudder Half'],
  ['TMF', 'Tough Mudder Full'],
  ['TRM', 'Tough Mudder'],
  ['RTM', 'Toughest Mudder'],
  ['TMX', 'Tough Mudder X']
].each do |code, name|
  EventBrand.create!(name: name, code: code)
end

CSV.foreach('lib/assets/events.csv', headers: true) do |row|
  event_market = EventMarket.create!(name: row[0])

  country = Country.find_or_create_by(name: row[13])

  unless Location.exists?(venue_name: row[7])
    location = Location.create!(
      venue_name:   row[7],
      city:        row[10],
      address:     row[8],
      address_two: row[9],
      state:       row[11],
      postal_code: row[12],
      country_id: country.id
    )
  else
    location = Location.find_by(venue_name: row[7])
  end

  unless Event.exists?(name: row[2])
    event = Event.create!(
      name:            row[2],
      weekend_name:    row[1],
      year:            row[3],
      adjusted_start:      Date.strptime(row[4], '%m/%d/%y'),
      start_date_time: DateTime.strptime(row[5], '%m/%d/%Y %H:%M'),
      end_date_time:   DateTime.strptime(row[6], '%m/%d/%Y %H:%M'),
      event_market_id: event_market.id,
      location_id:     location.id
    )
  else
    event = Event.find_by_name(row[2])
  end

  if row[14]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('TM5K').id)
  end

  if row[15]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('TMH').id)
  end

  if row[16]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('TMF').id)
  end

  if row[17]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('TRM').id)
  end

  if row[18]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('RTM').id)
  end

  if row[19]
    EventType.create!(event_id: event.id, event_brand_id: EventBrand.find_by_code('TMX').id)
  end
end
