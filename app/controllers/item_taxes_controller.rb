class ItemTaxesController < ApplicationController
	before_action :set_item_tax, only: [:show, :edit, :update, :destroy]
	before_action :set_item, except: [:calculate_total]

	def new
		@item_tax = ItemTax.new
	end

	def create
		@item_tax = @item.item_taxes.new(item_tax_params)
		if @item_tax.save
			redirect_to item_item_taxes_path(@item), notice: 'Item tax added successfully'
		else
			render :new
		end
	end

	def index
		@item_taxes = @item.item_taxes.all
	end

	def show
	end

	def edit
	end

	def update
		if @item_tax.update(item_tax_params)
			redirect_to item_item_taxes_path(@item), notice: 'Item tax updated successfully'
		else
			render :edit
		end
	end

	def destroy
		if @item_tax.destroy
			redirect_to item_item_taxes_path(@item), notice: 'Item tax deleted successfully'
		else
			redirect_to item_item_taxes_path(@item), notice: 'Item tax not deleted'
		end
	end

	def calculate_total
		data = ItemTax.calculate_total(params[:item_ids])
		@items_data = data[:items_data]
		@total = data[:total]
	end

	private

	def set_item
		@item = Item.find_by(id: params[:item_id])
	end

	def set_item_tax
		@item_tax = ItemTax.find_by(id: params[:id])
	end

	def item_tax_params
		params.require(:item_tax).permit(:name, :tax_type, :tax, :item_id)
	end

end