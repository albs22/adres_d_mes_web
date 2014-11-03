class Event < ActiveRecord::Base
  has_many :violations
  has_one :user

  attr_accessible :date, :description, :lat, :lng, :location, :title, :user
end
