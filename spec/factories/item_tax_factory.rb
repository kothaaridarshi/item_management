FactoryGirl.define do
  factory :item_tax do
    name 'GST'
    tax_type :percentage
    tax 6
    item_id 1
  end
end