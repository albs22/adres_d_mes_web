class HomeController < ApplicationController
  def index
     @recent_violations = Violation.where(:approved => 't').last(2).reverse
     @clean_count = Violation.where(:status => 'closed').count
  end
end
