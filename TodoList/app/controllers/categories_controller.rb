class CategoriesController < ApplicationController
	before_action :authenticate_user!
	def index
		@categories = Category.all
		render :index
	end
	def new
		@category = Category.new
		render :new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render :new
		end
	end

	def edit
		@category = Category.find(params[:id])
		render :edit
	end

	def update
		@category = List.find(params[:id])
		if @category.update(category_params)
			redirect_to categories_path
		else
			render :edit
		end
	end
	
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to lists_path
	end
	def show
		@category = Category.find(params[:id])
		render :show
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end