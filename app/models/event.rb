require 'chronic'

class Event < ActiveRecord::Base
  has_many :violations
  has_one :user

  attr_accessible :date, :description, :lat, :lng, :location, :title, :user

  def date=(date)
    write_attribute(:date, Chronic.parse(date).to_formatted_s(:db))
  end

end
