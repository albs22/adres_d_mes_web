class Violation < ActiveRecord::Base      
  attr_accessible :lat, :long, :date_entered, :description, :status, :violation_type
end
