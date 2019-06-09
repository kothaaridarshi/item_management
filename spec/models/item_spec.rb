require 'rails_helper'

RSpec.describe Item, type: :model do
	context 'validations' do
	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:rate) }
	  it { should validate_numericality_of(:rate) }
	  subject { Item.new(name: "Item", rate: 1234) } 
	  it { should validate_uniqueness_of(:name).scoped_to(:item_category_id) }
	end
	context 'associations' do
	  it { should belong_to(:item_category) }
	  it { should have_many(:item_taxes).dependent(:destroy) }
	end
end