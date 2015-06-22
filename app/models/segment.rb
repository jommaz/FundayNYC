class Segment < ActiveRecord::Base
  belongs_to :funday
  has_one :venue
  geocoded_by :full_street_address
# auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode, if: :address_changed?
end
