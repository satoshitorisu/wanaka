class Game < ApplicationRecord
  belongs_to :team

	geocoded_by :place
	after_validation :geocode, :if => :place_changed?
end
