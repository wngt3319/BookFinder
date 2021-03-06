class ShelvesController < ApplicationController
	before_filter :is_admin, only: [:new, :create, :edit, :update, :destroy]
	
	def index
		@shelves = Shelf.all
	end

	def show
		@shelf = Shelf.find(params[:id])
	end

	def new
		@shelf = Shelf.new
	end

	def create
		@shelf = Shelf.new(shelf_params)
		if @shelf.save
			flash[:success] = "Shelf created"
     		redirect_to @shelf
		else
    		render 'new'
		end
	end

	def edit
		@shelf = Shelf.find(params[:id])
	end

	def update
		@shelf = Shelf.find(params[:id])
		if @shelf.update_attributes(shelf_params)
			flash[:success] = "Shelf edited"
     		redirect_to @shelf
		else
			render 'edit'
		end
	end

	def destory
		@shelf = Shelf.find(params[:id])
		@shelf.delete
		flash[:success] = "Shelf deleted."
   		redirect_to shelves_url
	end

	private
		def shelf_params
			params.require(:shelf).permit(:floor, :subject, :section, :shelf_number, :x, :y)
		end

		def is_admin
			if session[:std_user_id] != "admin"
				flash[:error] = "You must be admin"
				render "main/index" # halts request cycle
			end
		end
end
