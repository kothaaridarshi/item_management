class ItemCategory < ApplicationRecord
	# Associations
	has_many :items, dependent: :destroy

	# Validations
	validates :name, presence: true, uniqueness: true
end
