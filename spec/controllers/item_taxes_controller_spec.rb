require 'rails_helper'

RSpec.describe ItemTaxesController, type: :controller do
  describe 'ItemTaxes controller request specs' do
    
    let(:first_item_category) { FactoryGirl.create(:item_category) }
    let(:first_item) { FactoryGirl.create(:item, item_category_id: first_item_category.id) }
    let(:first_item_tax) { FactoryGirl.create(:item_tax, item_id: first_item.id) }
    let(:params) do
      {
        'item_id': first_item.id
      }
    end
    let(:show_params) do
      {
        'item_id': first_item.id,
        'id': first_item_tax.id
      }
    end
    let(:create_params) do
      {
        'item_id' => first_item.id,
        'item_tax' => { 
          'name' => 'TestItemTax',
          'tax' => 10,
          'tax_type' => :percentage
        }
      }
    end
    let(:create_error_params) do
      {
        'item_id' => first_item.id,
        'item_tax' => { 
          'name' => 'TestItemTax',
          'tax_type' => :percentage
        }
      }
    end

    context 'GET #index' do
      it 'should success and render to index page' do
        first_item_tax
        get :index, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:item_taxes).count).to eq(1)
      end

      it 'when no items availabel render to index page' do
        get :index, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
        expect(assigns(:item_taxes).count).to eq(0)
      end
    end

    context 'GET #show' do
      it 'should success and render to show page' do
        first_item_tax
        get :show, show_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item_tax)).to eq(first_item_tax)
      end

      it 'when no item availabel and render to show page' do
        first_item_tax.destroy
        get :show, show_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:item_tax)).to eq(nil)
      end
    end

    context 'GET #new' do
      it 'should success and render to new page' do
        get :new, params
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(assigns(:item_tax)).to be_a_new(ItemTax)
      end
    end

    context 'POST #create' do
      it 'should success and render to index page' do
        post :create, create_params
        expect(ItemTax.count).to eq(1)
        expect(flash[:notice]).to eq('Item tax added successfully')
      end
      it 'should success and render to index page' do
        first_item_tax
        post :create, create_error_params
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
        expect(ItemTax.count).to eq(1)
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
        item_tax = first_item_tax
        params = {
          item_tax: {
            name: 'Test Item'
          }
        }
        put :update, params: { id: item_tax.id, item_id: item_tax.item.id, item_tax: params[:item_tax] }
        item_tax.reload
        expect(item_tax.attributes['name']).to eq params[:item_tax][:name]
        expect(flash[:notice]).to eq('Item tax updated successfully')
      end

      it 'should not update item info on error' do
        item_tax = first_item_tax
        params = {
          item_tax: {
            name: ''
          }
        }
        put :update, params: { id: item_tax.id, item_id: item_tax.item.id, item_tax: params[:item_tax] }
        item_tax.reload
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
        expect(item_tax.name).to eq item_tax.name
      end
    end

    context 'DELETE #destroy' do
      it 'should delete item' do
        item_tax = first_item_tax
        delete :destroy, params: { id: item_tax.id, item_id: item_tax.item.id }
        expect(flash[:notice]).to eq 'Item tax deleted successfully'
      end
    end

    context 'GET #calculate_total' do
      it 'should calculate total' do
        item_tax = first_item_tax
        item_id = item_tax.item.id
        second_item_tax = FactoryGirl.create(:item_tax, item_id: item_id)
        get :calculate_total, params: {item_ids: [item_id]}
        expect(assigns(:items_data).count).to eq(1)
        expect(assigns(:items_data).first[:tax]).to eq(12.0)
        expect(assigns(:items_data).first[:rate]).to eq(100.0)
        expect(assigns(:items_data).first[:total]).to eq(112.0)
      end
    end 
  end
end