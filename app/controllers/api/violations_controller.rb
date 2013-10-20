class Api::ViolationsController < ApplicationController

  def index
    @violations = Violation.all
    respond_to do |format|
#    format.json {render :json => {:violations => @violations.as_json}}
  format.json { render :json => {:violations => @violations.as_json(:only =>
         [:id, :date_entered, :date_entered, :lat, :long, :description, :violation_type, :violation_address, :status], 
         :methods => [:image_before_url])  }, :callback => params[:callback]}
    end
  end

  def create
    @violation = Violation.new(params[:user])
    respond_to do |format|
      if @user.save
        format.json { render json: 'Success' }
      else
        format.json { render json: 'Fail' }
      end
    end
  end

end
