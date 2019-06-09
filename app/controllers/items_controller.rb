class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
	before_action :set_item_category

	def new
		@item = Item.new
	end

	def create
		@item = @item_category.items.new(item_params)
		if @item.save
			redirect_to item_category_items_path(@item_category), notice: 'Item added successfully'
		else
			render :new
		end
	end

	def index
		@items = @item_category.items.all
	end

	def show
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to item_category_items_path(@item_category), notice: 'Item updated successfully'
		else
			render :edit
		end
	end

	def destroy
		if @item.destroy
			redirect_to item_category_items_path(@item_category), notice: 'Item deleted successfully'
		else
			redirect_to item_category_items_path(@item_category), notice: 'Item not deleted'
		end
	end

	private

	def set_item_category
		@item_category = ItemCategory.find_by(id: params[:item_category_id])
	end

	def set_item
		@item = Item.find_by(id: params[:id])
	end

	def item_params
		params.require(:item).permit(:name, :rate, :item_category_id)
	end

end