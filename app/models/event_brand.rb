class EventBrand < ApplicationRecord
  has_many :event_types
  has_many :events, through: :event_types
end
