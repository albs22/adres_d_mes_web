class ViolationsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :destroy, :manage]

  def index
    @violations = Violation.approved

     
    @status_filter = "Status"
    filtering_params(params).each do |key, value|
      if key == 'status'
        puts "key: " + key
        puts "value: " + value 
        @status_filter = value
      end

      @violations = @violations.public_send(key, value) if value.present?
    end

    @violations = @violations.paginate(page: params[:page], :per_page => 20)

#    if params[:sort] == 'open'
#     @violations = @violations.where(:status => 'open')
#   end
#   if params[:sort] == 'closed'
#     @violations = @violations.where(:status => 'closed')
#   end
  end
  
  def show
    #only show not approved messes to admins
    @violation = Violation.find(params[:id])

    if @violation.approved? || signed_in_admin?
       respond_to do |format|
         format.html # show.htmb
       end
    else
      redirect_to root_path
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
    @violation = Violation.new(mess_params)
    @violation.date_entered = DateTime.now 
    @violation.status = 'open'
# @violation.event = Event.find(params[:event])
#   respond_to do |format|
      puts "New Mess Created"
      if @violation.save
        flash[:success] = "Violation Submitted!"
  # redirect_to :action=>'show', :id => @violation.id #@violation, notice: 'Violation Created.'
        puts "Send Approval Email"
        MessMailer.approval_email(@violation).deliver
              puts "New Mess Created"
        redirect_to root_path
      else
         redirect_to :action => "new"
      end
#   end
  end

  def approve
    @violation = Violation.find(params[:id])
    @violation.approved = true
    @violation.save
    logger.info "Approve Method"
    redirect_to root_path
  end
  
  #PUT /violations/1
  def update
    @violation = Violation.find(params[:id])
   
    if !params[:update_type].present? 
      if @violation.update_attributes(params[:violation])
        if @violation.status == 'closed'
          @violation.date_closed = Time.now
          @violation.save
        end
        flash[:success] = "Mess updated"
        redirect_to root_path
      else
        flash[:error] = "Could not update Mess"
        render action: 'edit'
      end
   else
     if params[:update_type] = "approve"
       @violation.approved = true
       if @violation.save 
         flash[:success] = "Mess Approved!"
       else
         flash[:error] = "Could not approve mess"
       end
       redirect_to manage_path
     end    
   end
    
  end
  
  def destroy
    @violation = Violation.find(params[:id])
    @violation.destroy
 
    redirect_to violations_url
  end

  def manage

    @violations = Violation.paginate(page: params[:page], :per_page => 10)

    @violations = @violations.where(:approved => 'f')
       
  end

  def approve
     @violation = Violation.find(params[:id])
     @violation.approved = true
     @violation.save    
     redirect_to manage_path
    
  end


  private

    def signed_in_user
      redirect_to root_path unless signed_in?
    end

    def mess_params
      params.require(:violation).permit(:lat, :lng, :violation_address, :violation_type,
          :description, :status, :image_before, :image_after, :approved, :date_closed, :event_id)
    end

    def filtering_params(params)
      params.slice(:status, :time_span)
    end
        

end
