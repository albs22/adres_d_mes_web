class HomeController < ApplicationController
  def index
    @violations = Violation.all
  end
end
