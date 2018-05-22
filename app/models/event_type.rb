class EventType < ApplicationRecord
  belongs_to :event
  belongs_to :event_brand
end
