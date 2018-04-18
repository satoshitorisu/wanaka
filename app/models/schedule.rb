class Schedule < ApplicationRecord
  belongs_to :team


	geocoded_by :place

end
