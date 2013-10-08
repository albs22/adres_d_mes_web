class Api::ViolationsController < ApplicationController

  def index
    @violations = Violation.all
    respond_to do |format|
      format.json { render :json => @violations }
    end
  end

end
