Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :item_categories do
  	resources :items
  end
  root to: 'item_categories#index'
  get '/items/:item_id/item_taxes' => 'item_taxes#index', as: 'item_item_taxes'
  post '/items/:item_id/item_taxes' => 'item_taxes#create'
 	get '/items/:item_id/item_taxes/new' => 'item_taxes#new', as: 'new_item_item_tax'
	get '/items/:item_id/item_taxes/:id/edit' => 'item_taxes#edit', as: 'edit_item_item_tax'
  get '/items/:item_id/item_taxes/:id' => 'item_taxes#show', as: 'item_item_tax'
  patch '/items/:item_id/item_taxes/:id' => 'item_taxes#update'
  delete '/items/:item_id/item_taxes/:id' => 'item_taxes#destroy'
  post '/calculate_total' => 'item_taxes#calculate_total'
end
