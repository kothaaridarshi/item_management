class Item < ApplicationRecord
	# Associations
  belongs_to :item_category
  has_many :item_taxes, dependent: :destroy

  # Validations
  validates :name, :rate, presence: true
  validates :name, uniqueness: { scope: :item_category_id }
  validates :rate, numericality: { only_float: true }
end
