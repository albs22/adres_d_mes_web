class ViolationsController < ApplicationController

  def index
    @violations = Violation.all

    respond_to do |format|
      format.html # index.html.erb
      
    end
  end
  
   def show
    @violation = Violation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @violation = Violation.new
    
    respond_to do |format|
      format.html
    end
  end

  # POST /vioaltions
  def create
    @violation = Violation.new(params[:violation])
   
    respond_to do |format|
      if @violation.save
       flash[:success] = "Violation Submitted!"
        redirect_to :action=>'show', :id => @violation.id #@violation, notice: 'Violation Created.'
      else
        render action: "new"
       end
    end
  end


end
