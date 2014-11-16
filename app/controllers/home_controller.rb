class HomeController < ApplicationController
  def index
     @recent_violations = Violation.where(:approved => 't', :status => 'open').last(2).reverse
     @clean_count = Violation.where(:status => 'closed').count
     @recent_events = Event.order('date').first(1)
  end
end
