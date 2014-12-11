class InstructorsController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :index]
	before_action :require_same_user, only: [:edit, :update, :index]
	before_action :require_admin, only: [:new, :create, :show, :edit, :update, :index]

	def index		 
	    @instructors = Instructor.all
	end

	def show
	 @instructor = Instructor.find(params[:id])
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

	def edit
		@instructor = Instructor.find(params[:id])
    end

	def update
		#binding.pry
		@instructor = Instructor.find(params[:id])
	  	if @instructor.update(instructor_params)
	      
	  		flash[:notice] = "This instructor has been updated."
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
  		@user = User.find_by id: params[:id]
  	end

	def require_same_user
		if current_user != @current_user
		flash[:error] = "You're not allowed to do that."
		redirect_to root_path
	end
	end

end