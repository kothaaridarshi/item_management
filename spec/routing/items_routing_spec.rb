require 'rails_helper'

describe "routing to items" do
  it "routes /item_categories/1/items to items#index" do
    expect(get: "/item_categories/1/items").to route_to(
      controller: "items",
      action: "index",
      item_category_id: "1"
    )
  end

  it "routes /item_categories/1/items/1 to items#show" do
    expect(get: "/item_categories/1/items/1").to route_to(
      controller: "items",
      action: "show",
      item_category_id: "1",
      id: "1"
    )
  end

  it "routes /item_categories/1/items/new to items#new" do
    expect(get: "/item_categories/1/items/new").to route_to(
      controller: "items",
      action: "new",
      item_category_id: "1"
    )
  end

  it "routes /item_categories/1/items to items#create" do
    expect(post: "/item_categories/1/items").to route_to(
      controller: "items",
      action: "create",
      item_category_id: "1"
    )
  end

  it "routes /item_categories/1/items/1/edit to items#edit" do
    expect(get: "/item_categories/1/items/1/edit").to route_to(
      controller: "items",
      action: "edit",
      item_category_id: "1",
      id: "1"
    )
  end

  it "routes /item_categories/1/items/1 to items#update" do
    expect(put: "/item_categories/1/items/1").to route_to(
      controller: "items",
      action: "update",
      item_category_id: "1",
      id: "1"
    )
  end

  it "routes /item_categories/1/items/1 to items#update" do
    expect(patch: "/item_categories/1/items/1").to route_to(
      controller: "items",
      action: "update",
      item_category_id: "1",
      id: "1"
    )
  end

  it "routes /item_categories/1/items/1 to items#destroy" do
    expect(delete: "/item_categories/1/items/1").to route_to(
      controller: "items",
      action: "destroy",
      item_category_id: "1",
      id: "1"
    )
  end
end