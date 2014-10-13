class InstructorsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :require_same_user, only: [:edit, :update]
	before_action :require_admin, only: [:new, :create, :show, :edit, :update]

	def show		
	end

	def new
		@instructor = Instructor.new
	end

	def create
		@instructor = Instructor.new(instructor_params)

		if @instructor.save
			flash[:notice] = "New instructor was successfully added."
			redirect_to :back
		else
			render :new
		end
	end

	def edit;
  	end

	def update
	  	if @instructor.update(instructor_params)
	  		flash[:notice] = "Instructor profile is updated!"
	  		redirect_to instructor_path(@instructor)
	  	else
	  		render :edit
		end
	end

	private

	def instructor_params
		params.require(:instructor).permit(:name, :email)
	end

	def set_user
  		@user = user.find_by id: params[:id]
  	end

	def require_same_user
		if current_user != @current_user
		flash[:error] = "You're not allowed to do that."
		redirect_to root_path
	end
	end

end