class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :show_all]
   before_action :require_same_user, only: [:edit, :update, :show_all]
   before_action :require_admin, only: [:index, :report, :export_to_csv]

  def welcome    
  end

  def index   
  @users = User.all(:order => "lastname, firstname") 
  end

   def show   	
   end

   def show_all     
   end

   def query
    @users = User.where(Hash[*params[:specs].split("/")])
    #binding.pry
    if @users.empty?
      flash[error: "Can't find users with those properties"]      
     end
     render :index
   end

   def report
     @users = User.all(:order => "instructor_id")

      

    #@users = User.order(lastname: :asc).take(500)
    #@users = User.find(:all, :order => "lastname, firstname")
    #@users = User.all(:order => "instructor_id")
    #@users = User.where(firstname: true)
    #@users = User.take(500).order(:created_at)  

   end


def export_to_csv       
    @users = User.all(:order => "instructor_id")
    csv_string = CSV.generate do |csv|
         csv << ["First Name", "Last Name", "Email", "Description","Instructor"]
         @users.each do |user|
           csv << [user.firstname, user.lastname, user.email,  user.slot.description, user.instructor.name]
         end
    end         
  
   send_data csv_string,
   :type => 'text/csv; charset=iso-8859-1; header=present',
   :disposition => "attachment; filename=users.csv" 
end 


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	 
  	if @user.save
  		session[:user_id] = @user.id
  		flash[:notice] = "You have successfully registered!"
  		redirect_to edit_user_path(@user)
  	else
  		render :new
    end
  end

  def edit;
  end

  def update
  	if @user.update(user_params)
       current_user.update_slot_assigned_with_count(params[:id])
      #binding.pry
      AppMailer.welcome_email(@user).deliver
  		flash[:notice] = "#{@user.firstname} #{@user.lastname}, your seat is reserved for #{@user.slot.description}."
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end


  private

  def user_params
  		params.require(:user).permit(:role, :firstname, :lastname, :email, :password, :instructor_id, :slot_id)
  	end

  	def set_user
  		@user = User.find_by id: params[:id]
  	end

  	def require_same_user #but allow admin
  		if ! current_user.admin? && current_user != @user
  		flash[:error] = "You're not allowed to do that."
  		redirect_to root_path
  	end
  end

end
