class SlotsController < ApplicationController
	before_action :set_user, only: [:index, :show, :edit, :update]
	before_action :require_same_user, only: [:index, :show, :edit, :update]
	before_action :require_admin, only: [:new, :create, :show, :edit, :update]

	def index		 
	    @slots = Slot.all
	end

	def show
	 @slots = Slot.all		
	end

	def new
		@slot = Slot.new
	end

	def create
		@slot = Slot.new(slot_params)

		if @slot.save
			flash[:notice] = "New slot was successfully added."
			redirect_to :back
		else
			render :new
		end
	end

	def edit;
    end

	def update
	  	if @slot.update(slot_params)
	      #binding.pry
	  		flash[:notice] = "This slot is updated."
	  		redirect_to slot_path(@slot)
	  	else
	  		render :edit
	  	end
	end

	private

	def slot_params
		params.require(:slot).permit(:description, :list_order, :assigned)
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