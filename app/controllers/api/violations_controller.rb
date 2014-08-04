Class Api::ViolationsController < ApplicationController

  def index
    @violations = Violation.where(:approved => 't').where(:status => 'open')
    respond_to do |format|
      format.json { render :json => {:violations => @violations.as_json(:only =>
         [:id, :lat, :lng, :description, :violation_type, :violation_address, :status], 
         :methods => [:date_submitted, :image_before_url_t, :image_before_url_f, :image_after_url_t, :image_after_f])  }, :callback => params[:callback]}
    end
  end

  def create
    #Remove Image urls from incoming JSON
    remove_unused_params(params[:violation])
    
    base64img = params[:violation][:image_before]
    
    if base64img
      data = StringIO.new(Base64.decode64(base64img))
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "mess.jpg"
      data.content_type = "image/jpeg"
      params[:violation][:image_before] = data  
    end

    @violation = Violation.new(params[:violation])
    @violation.date_entered =  DateTime.now
    
    respond_to do |format|
   if @violation.save
       format.json { render json: 'Success' }
     else
       format.json { render json: 'Fail' }
     end
   end

  end

  def update

    params.delete :_dc
    params.delete :format
    #params.delete :date_submitted
    remove_unused_params(params[:violation])
    @violation = Violation.find(params[:id])
    params.delete :id 
    respond_to do |format|
      if @violation.update_attributes(params[:violation])
        format.json { render json: '{success: true, msg:"Mess Update: Success"}' }
      else
        format.json { render json: '{success: false, msg:"Mess Upate: "Failed"}' }
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
