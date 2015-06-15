class Segment < ActiveRecord::Base
  belongs_to :funday
  has_one :venue
end
