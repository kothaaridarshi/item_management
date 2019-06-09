require 'rails_helper'

describe "routing to item_taxes" do
  it "routes /items/1/item_taxes to item_taxes#index" do
    expect(get: "/items/1/item_taxes").to route_to(
      controller: "item_taxes",
      action: "index",
      item_id: "1"
    )
  end

  it "routes /items/1/item_taxes/1 to item_taxes#show" do
    expect(get: "/items/1/item_taxes/1").to route_to(
      controller: "item_taxes",
      action: "show",
      item_id: "1",
      id: "1"
    )
  end

  it "routes /items/1/item_taxes/new to item_taxes#new" do
    expect(get: "/items/1/item_taxes/new").to route_to(
      controller: "item_taxes",
      action: "new",
      item_id: "1"
    )
  end

  it "routes /items/1/item_taxes to item_taxes#create" do
    expect(post: "/items/1/item_taxes").to route_to(
      controller: "item_taxes",
      action: "create",
      item_id: "1"
    )
  end

  it "routes /items/1/item_taxes/1/edit to item_taxes#edit" do
    expect(get: "/items/1/item_taxes/1/edit").to route_to(
      controller: "item_taxes",
      action: "edit",
      item_id: "1",
      id: "1"
    )
  end

  it "routes /items/1/item_taxes/1 to item_taxes#update" do
    expect(patch: "/items/1/item_taxes/1").to route_to(
      controller: "item_taxes",
      action: "update",
      item_id: "1",
      id: "1"
    )
  end

  it "routes /items/1/item_taxes/1 to item_taxes#destroy" do
    expect(delete: "/items/1/item_taxes/1").to route_to(
      controller: "item_taxes",
      action: "destroy",
      item_id: "1",
      id: "1"
    )
  end

  it "calulate_total to item_taxes#calulate_total" do
    expect(post: "/calculate_total").to route_to(
      controller: "item_taxes",
      action: "calculate_total"
    )
  end
end