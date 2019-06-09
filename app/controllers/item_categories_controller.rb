class ItemCategoriesController < ApplicationController
	before_action :set_item_category, only: [:show, :edit, :update, :destroy]

	def new
		@item_category = ItemCategory.new
	end

	def create
		@item_category = ItemCategory.new(item_category_params)
		if @item_category.save
			redirect_to item_categories_path, notice: 'Item category added successfully'
		else
			render :new
		end
	end

	def index
		@item_categories = ItemCategory.all
	end

	def show
	end

	def edit
	end

	def update
		if @item_category.update(item_category_params)
			redirect_to item_categories_path, notice: 'Item category updated successfully'
		else
			render :edit
		end
	end

	def destroy
		if @item_category.destroy
			redirect_to item_categories_path, notice: 'Item category deleted successfully'
		else
			redirect_to item_categories_path, notie: 'Item category not deleted'
		end
	end

	private

	def set_item_category
		@item_category = ItemCategory.find_by(id: params[:id])
	end

	def item_category_params
		params.require(:item_category).permit(:name)
	end

end