class Event < ActiveRecord::Base
  has_many :violations

  attr_accessible :date, :description, :location, :title, :user
end
