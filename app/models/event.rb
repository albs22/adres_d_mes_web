require 'chronic'

class Event < ActiveRecord::Base
  has_many :violations
  has_one :user

  scope :upcoming, lambda { where("date >= ?", Date.today) }

  attr_accessible :date, :description, :lat, :lng, :location, :title, :user

  def date=(date)
    write_attribute(:date, Chronic.parse(date).to_formatted_s(:db))
  end

  def self.open
    Event.where(["date >= ?", Time.now])
  end

end
