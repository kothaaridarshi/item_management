require 'rails_helper'

RSpec.describe ItemTax, type: :model do
	context 'validations' do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:tax) }
	  it { should validate_numericality_of(:tax) }
	end
	context 'associations' do
	  it { should belong_to(:item) }
	end
	context 'enums' do
		it { should define_enum_for(:tax_type) }
	end
end