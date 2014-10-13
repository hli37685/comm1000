class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update]
   before_action :require_same_user, only: [:edit, :update]

   def show   	
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
      #binding.pry
  		flash[:notice] = "Your seat is reserved!"
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end


  private

  def user_params
  		params.require(:user).permit(:firstname, :lastname, :email, :password, :instructor_id, :slot_id)
  	end

  	def set_user
  		@user = User.find_by id: params[:id]
  	end

  	def require_same_user
  		if current_user != @user
  		flash[:error] = "You're not allowed to do that."
  		redirect_to root_path
  	end
  end

end
