class Api::ViolationsController < ApplicationController

  def index
    @violations = Violation.all
    respond_to do |format|
      format.json { render :json => @violations }
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
