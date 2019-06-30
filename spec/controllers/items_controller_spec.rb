require 'rails_helper'

describe ItemsController do
  let(:image) { create(:image) }

  describe '#index' do
    before {get :index}
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns Item.all' do
      expect(assigns(:items)).to match_array(@item)
    end
    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe '#new' do
    before {get :new}
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns @item' do
      expect(assigns(:item)).to be_a_new Item
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end
  describe '#create' do
    let(:params) { {item: attributes_for(:item)}}     
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'has a 200 status code' do
          expect(response).to have_http_status(:ok)
        end
        it 'save Item' do
          expect{ subject }.to change(Item, :count).by(1)
        end
        it 'renders the :index template when save' do
          subject
          expect(response).to render_template :index
        end
      end

      context 'can not save' do
        let(:invalid_params) { {item: attributes_for(:item, name: nil, detail:nil, price:nil,image:nil)}}  
        subject {
          post :create,
          params: invalid_params
        }
        it 'has a 200 status code' do
          expect(response).to have_http_status(:ok)
        end
        it 'not save Item' do
          expect{ subject }.not_to change(Item, :count)
        end
        it 'renders the :new template when not save' do
          subject
          expect(response).to render_template :new
        end
      end
    end
end

