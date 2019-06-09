class ItemTax < ApplicationRecord
  # Associations
  belongs_to :item

  # Validations
  validates :name, :tax, presence: :true
  validates :tax, numericality: { only_float: true }

  # Enums
  enum tax_type: [:percentage, :value]

  def self.calculate_total(item_ids)
  	items_data = []
  	items = Item.where(id: item_ids).select(:id, :rate, :name)
		items.each do |item|
			item_taxes = ItemTax.where(item_id: item.id)
			percentage_amt = (item.rate * item_taxes.percentage.pluck(:tax).sum) / 100
			value_amt = item_taxes.value.pluck(:tax).sum
			items_data.push({ name: item.name, rate: item.rate,
			 								 tax: (percentage_amt + value_amt).round(2),
			 								 total: (item.rate + value_amt + percentage_amt).round(2) })
		end
		{ 
			items_data: items_data,
		  total: { rate: items_data.sum{ |item| item[:rate] },
						  tax: items_data.sum{ |item| item[:tax] },
							total: items_data.sum{ |item| item[:total] }}
		}
  end

end
