require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
	context 'validations' do
	  it { should validate_presence_of(:name) }
	  subject { ItemCategory.new(name: 'ItemCategory') }
	  it { should validate_uniqueness_of(:name) }
	end
	context 'associations' do
	  it { should have_many(:items).dependent(:destroy) }
	end
end