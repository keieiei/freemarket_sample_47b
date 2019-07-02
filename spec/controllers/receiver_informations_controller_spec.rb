require 'rails_helper'

describe ReceiverInformationsController, type: :controller do
  let(:user) { create(:user) }
  let(:receiver_information_hash) { attributes_for(:receiver_information, user: user) }
  let(:receiver_information_invalid_hash) { attributes_for(:receiver_information, family_name: nil, user: user) }

  describe "Get #new" do
    context 'sign-in' do
      before do
        login user
        get :new, params: {user_id: user.id}
      end
      it '@receiver_informationに新しいユーザーを割り当てること' do
        expect(assigns(:receiver_information)).to be_a_new(ReceiverInformation)
      end
      it '@page_numberが3であること' do
        expect(assigns(:page_number)).to eq 3
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
  let(:params) { { user_id: user.id, receiver_information: receiver_information_hash } }
  let(:params_invalid) { { user_id: user.id, receiver_information: receiver_information_invalid_hash } }
    context 'sign-in' do
      before do
        login user
      end
      context 'valid' do
        subject {
          post :create,
          params: params
        }
        it 'count up receiver_information' do
          expect{ subject }.to change(ReceiverInformation, :count).by(1)
        end
        it 'redirect_to new_user_credit_card_path' do
          subject
          expect(response).to redirect_to(new_user_credit_card_path(user))
        end
      end
      context 'invalid' do
        subject {
          post :create,
          params: params_invalid
        }
        it 'not count up user' do
          expect{ subject }.not_to change(ReceiverInformation, :count)
        end
        it '@page_numberが3であること' do
          subject
          expect(assigns(:page_number)).to eq 3
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