class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	include SessionsHelper


  protected
  def format_date_db(dt)
    return DateTime.strptime(dt, "%m/%d/%Y %I:%M %p")
  end

end
