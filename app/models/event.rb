class Event < ActiveRecord::Base
  has_many :violations
  has_one :user
  has_one :location

  attr_accessible :date, :description, :location, :title, :user
end
