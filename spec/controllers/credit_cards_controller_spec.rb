require 'rails_helper'

describe CreditCardsController, type: :controller do
  let(:user) { create(:user) }
  let(:credit_card_hash) { attributes_for(:credit_card, user: user) }
  let(:credit_card_invalid_hash) { attributes_for(:credit_card, card_number: nil, user: user) }

  describe "Get #new" do
    context 'sign-in' do
      before do
        login user
        get :new, params: {user_id: user.id}
      end
      it '@credit_cardに新しいユーザーを割り当てること' do
        expect(assigns(:credit_card)).to be_a_new(CreditCard)
      end
      it '@page_numberが4であること' do
        expect(assigns(:page_number)).to eq 4
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end
    context 'sign-out' do
      it "redirect to new_user_registration_path" do
        get :new, params: { user_id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "Post #create" do
  let(:params) { { user_id: user.id, credit_card: credit_card_hash } }
  let(:params_invalid) { { user_id: user.id, credit_card: credit_card_invalid_hash } }
    context 'sign-in' do
      before do
        login user
      end
      context 'valid' do
        subject {
          post :create,
          params: params
        }
        it 'count up credit_card' do
          expect{ subject }.to change(CreditCard, :count).by(1)
        end
        it 'redirect_to users_sign_up_complete_path' do
          subject
          expect(response).to redirect_to(users_sign_up_complete_path)
        end
      end
      context 'invalid' do
        subject {
          post :create,
          params: params_invalid
        }
        it 'not count up user' do
          expect{ subject }.not_to change(CreditCard, :count)
        end
        it '@page_numberが4であること' do
          subject
          expect(assigns(:page_number)).to eq 4
        end
        it "render the :new" do
          subject
          expect(response).to render_template :new
        end
      end
    end
    context 'sign-out' do
      it "redirect to new_user_registration_path" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end