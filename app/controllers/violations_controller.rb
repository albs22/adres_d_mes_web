class ViolationsController < ApplicationController

  def index
    @violations = Violation.all

# respond_to do |format|
#     format.html # index.html.erb
      
#   end
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
  
  #GET /violations/1/edit
  def edit
    @violation = Violation.find(params[:id])
  end

  # POST /vioaltions
  def create
    @violation = Violation.new(params[:violation])
   
#   respond_to do |format|
      if @violation.save
        flash[:success] = "Violation Submitted!"
  # redirect_to :action=>'show', :id => @violation.id #@violation, notice: 'Violation Created.'
        redirect_to root_path
      else
         redirect_to :action => "new"
      end
#   end
  end
  
  #PUT /violations/1
  def update
    @violation = Violation.find(parama[:id])
      
    if @violation.update_attribute(params[:friend])
      redirect_to @violation, notice: 'Mess was successfully updated.' 
    else
      render action: "edit"
    end
  end
  
  def destroy
    @violation = Violation.find(params[:id])
    @violation.destroy

    redirect_to violations_url
  end
  
  
  


end
