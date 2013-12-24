class Api::ViolationsController < ApplicationController

  def index
    @violations = Violation.all
    respond_to do |format|
#    format.json {render :json => {:violations => @violations.as_json}}
  format.json { render :json => {:violations => @violations.as_json(:only =>
         [:id, :date_entered,  :lat, :lng, :description, :violation_type, :violation_address, :status], 
         :methods => [:image_before_url_t, :image_before_url_f, :image_after_url_t, :image_after_f])  }, :callback => params[:callback]}
    end
  end

  def create

     
     #   remove_unused_params(params[:violation])
      #  base64Img = params[:violation][:image_before]
      #   params[:violation][:image_before] = StringIO.new(Base64.decode64(base64img)
 #    params.delete :_dc
#     params.delete :format
# params[:violation].delete(:image_before_url)
                                                       #@violation = Violation.new(params[:violation])
#     @violation = Violation.new(params[:violation])
#     @violation = Violation.new(params[:violation].delete(:id))
     #    @violation = Violation.new(params.except!(:id))
#    @violation = Violation.new(params[:violation].delete(:id))
   # @violation = Violation.new
   # @violation.attributes(params[:violation].except(:id))
#    @violation.lat = params[:violation][:lat]
#    @violation.long = params[:violation][:long]
#    @violation.violation_type = params[:violation][:violation_type]
                                                       # respond_to do |format|
                                                       # if @violation.save
                                                       # format.json { render json: 'Success' }
                                                       #  else
                                                       #format.json { render json: 'Fail' }
                                                       # end
                                                       #end
  end

  def update

    params.delete :_dc
    params.delete :format
    remove_unused_params(params[:violation])
    @violation = Violation.find(params[:id])
    params.delete :id 
    respond_to do |format|
      if @violation.update_attributes(params[:violation])
        format.json { render json: 'Success' }
      else
        format.json { render json: 'fail' }
      end
    
    end

  end


  private

  def remove_unused_params(param)
     param.delete(:image_before_url_f)
     param.delete(:image_before_url_t)
     param.delete(:image_after_url_f)
     param.delete(:image_after_url_t)
  end

end
