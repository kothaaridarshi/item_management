require 'rails_helper'

RSpec.describe ItemCategoriesController, type: :controller do
  describe 'ItemCategories controller request specs' do
    
    let(:first_item_category) { FactoryGirl.create(:item_category) }
    let(:create_params) do
      {
        'item_category' => { 
          'name' => 'TestItemCategory',
        }
      }
    end
    let(:create_error_params) do
      {
        'item_category' => { 
          'name' => '',
        }
      }
    end

    context 'GET #index' do
      it 'should success and render to index page' do
        first_item_category
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:item_categories).count).to eq(1)
      end

      it 'when no items availabel render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:item_categories).count).to eq(0)
      end
    end

    context 'GET #show' do
      before :each do
        @item_category = first_item_category
      end
      it 'should success and render to show page' do
        get :show, {id: @item_category.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item_category)).to eq(@item_category)
      end

      it 'when no item availabel and render to show page' do
        id = @item_category.id
        @item_category.destroy
        get :show, {id: id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item_category)).to eq(nil)
      end
    end

    context 'GET #new' do
      it 'should success and render to new page' do
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(assigns(:item_category)).to be_a_new(ItemCategory)
      end
    end

    context 'POST #create' do
      it 'should success and render to index page' do
        post :create, create_params
        expect(ItemCategory.count).to eq(1)
        expect(flash[:notice]).to eq('Item category added successfully')
      end
      it 'should success and render to index page' do
        first_item_category
        post :create, create_error_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(ItemCategory.count).to eq(1)
      end
    end

    context 'GET #edit' do
      it 'should success and render to edit page' do
        get :edit, {id: first_item_category.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
      end
    end

    context 'PUT #update' do
      it 'should update item info' do
        item_category = first_item_category
        params = {
          item_category: {
            name: 'Test Item Category'
          }
        }
        put :update, params: { id: item_category.id, item_category: params[:item_category] }
        item_category.reload
        expect(item_category.attributes['name']).to eq params[:item_category][:name]
        expect(flash[:notice]).to eq('Item category updated successfully')
      end

      it 'should not update item info on error' do
        item_category = first_item_category
        params = {
          item_category: {
            name: ''
          }
        }
        put :update, params: { id: item_category.id, item_category: params[:item_category] }
        item_category.reload
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
        expect(item_category.name).to eq item_category.name
      end
    end

    context 'DELETE #destroy' do
      it 'should delete item' do
        item_category = first_item_category
        delete :destroy, params: { id: item_category.id }
        expect(flash[:notice]).to eq 'Item category deleted successfully'
      end
    end 
  end
end