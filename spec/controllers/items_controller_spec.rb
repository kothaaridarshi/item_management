require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'Items controller request specs' do
    
    let(:first_item_category) { FactoryGirl.create(:item_category) }
    let(:second_item_category) { FactoryGirl.create(:item_category, name: 'SecondItemCategory') }
    let(:first_item) { FactoryGirl.create(:item, item_category_id: first_item_category.id) }
    let(:second_item) { FactoryGirl.create(:item, item_category_id: second_item_category.id) }
    let(:params) do
      {
        'item_category_id': first_item_category.id
      }
    end
    let(:show_params) do
      {
        'item_category_id': first_item_category.id,
        'id': first_item.id
      }
    end
    let(:create_params) do
      {
        'item_category_id' => first_item_category.id,
        'item' => { 
          'name' => 'TestItem',
          'rate' => 10
        }
      }
    end
    let(:create_error_params) do
      {
        'item_category_id' => first_item_category.id,
        'item' =>  {
          'name' => '',
          'rate' => 10
        }
      }
    end

    context 'GET #index' do
      it 'should success and render to index page' do
        first_item
        second_item
        get :index, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:items).count).to eq(1)
      end

      it 'when no items availabel render to index page' do
        get :index, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:items).count).to eq(0)
      end
    end

    context 'GET #show' do
      it 'should success and render to show page' do
        first_item
        second_item
        get :show, show_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item)).to eq(first_item)
      end

      it 'when no item availabel and render to show page' do
        first_item.destroy
        get :show, show_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item)).to eq(nil)
      end
    end

    context 'GET #new' do
      it 'should success and render to new page' do
        get :new, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(assigns(:item)).to be_a_new(Item)
      end
    end

    context 'POST #create' do
      it 'should success and render to index page' do
        post :create, create_params
        expect(Item.count).to eq(1)
        expect(flash[:notice]).to eq('Item added successfully')
      end
      it 'should success and render to index page' do
        first_item
        post :create, create_error_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(Item.count).to eq(1)
      end
    end

    context 'GET #edit' do
      it 'should success and render to edit page' do
        get :edit, show_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
      end
    end

    context 'PUT #update' do
      it 'should update item info' do
        item = first_item
        params = {
          item: {
            name: 'Test Item'
          }
        }
        put :update, params: { id: item.id, item_category_id: item.item_category.id, item: params[:item] }
        item.reload
        expect(item.attributes['name']).to eq params[:item][:name]
        expect(flash[:notice]).to eq('Item updated successfully')
      end

      it 'should not update item info on error' do
        item = first_item
        params = {
          item: {
            name: ''
          }
        }
        put :update, params: { id: item.id, item_category_id: item.item_category.id, item: params[:item] }
        item.reload
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
        expect(item.name).to eq item.name
      end
    end

    context 'DELETE #destroy' do
      it 'should delete item' do
        item = first_item
        delete :destroy, params: { id: item.id, item_category_id: item.item_category.id }
        expect(flash[:notice]).to eq 'Item deleted successfully'
      end
    end 
  end
end