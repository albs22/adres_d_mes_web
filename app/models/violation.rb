class Violation < ActiveRecord::Base      
  attr_accessible :lat, :long, :date_entered, :date_closed, :description, :status, :violation_type, :image_before, :image_after, :violation_address

  has_attached_file :image_before, styles: {
    thumb: '130x100>',
    full: '1600x1200>'
  }

  has_attached_file :image_after, styles: {
    thumb: '130x100>',
    full: '1600x1200>'
  }
end
