require 'rails_helper'

describe "routing to item_categories" do
  it "routes /item_categories to item_categories#index" do
    expect(get: "/item_categories").to route_to(
      controller: "item_categories",
      action: "index"
    )
  end

  it "routes /item_categories/1 to item_categories#show" do
    expect(get: "/item_categories/1").to route_to(
      controller: "item_categories",
      action: "show",
      id: "1"
    )
  end

  it "routes /item_categories/new to item_categories#new" do
    expect(get: "/item_categories/new").to route_to(
      controller: "item_categories",
      action: "new"
    )
  end

  it "routes /item_categories to item_categories#create" do
    expect(post: "/item_categories").to route_to(
      controller: "item_categories",
      action: "create"
    )
  end

  it "routes /item_categories/1/edit to item_categories#edit" do
    expect(get: "/item_categories/1/edit").to route_to(
      controller: "item_categories",
      action: "edit",
      id: "1"
    )
  end

  it "routes /item_categories/1 to item_categories#update" do
    expect(put: "/item_categories/1").to route_to(
      controller: "item_categories",
      action: "update",
      id: "1"
    )
  end

  it "routes /item_categories/1 to item_categories#update" do
    expect(patch: "/item_categories/1").to route_to(
      controller: "item_categories",
      action: "update",
      id: "1"
    )
  end

  it "routes /item_categories/1 to item_categories#destroy" do
    expect(delete: "/item_categories/1").to route_to(
      controller: "item_categories",
      action: "destroy",
      id: "1"
    )
  end
end