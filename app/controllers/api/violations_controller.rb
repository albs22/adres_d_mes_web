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

     
 #    params.delete :_dc
#     params.delete :format
     params[:violation].delete(:image_before_url)
     @violation = Violation.new(params[:violation])
#     @violation = Violation.new(params[:violation])
#     @violation = Violation.new(params[:violation].delete(:id))
     #    @violation = Violation.new(params.except!(:id))
#    @violation = Violation.new(params[:violation].delete(:id))
   # @violation = Violation.new
   # @violation.attributes(params[:violation].except(:id))
#    @violation.lat = params[:violation][:lat]
#    @violation.long = params[:violation][:long]
#    @violation.violation_type = params[:violation][:violation_type]
    respond_to do |format|
      if @violation.save
        format.json { render json: 'Success' }
      else
        format.json { render json: 'Fail' }
      end
    end
  end

end
