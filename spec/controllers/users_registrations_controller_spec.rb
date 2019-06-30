require 'rails_helper'
RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end
  let(:user_login) { create(:user, user_create_hash) }
  let(:user_confirm_hash) { attributes_for(:user, icon: nil, profile: nil, phone_number: "") }
  let(:user_confirm_invalid_hash) { attributes_for(:user, nickname: "", icon: nil, profile: nil, phone_number: "") }
  let(:user_create_hash) { attributes_for(:user, icon: nil, profile: nil) }
  let(:user_create) { build(:user, user_create_hash) }
  let(:user_create_invalid_hash) { attributes_for(:user, nickname: "", icon: nil, profile: nil) }

  describe "Get #new" do
    context 'sign-in' do
      before do
        login user_login
        get :new
      end
      it "redirect to root_path" do
        expect(response).to redirect_to(root_path)
      end
    end
    context 'sign-out' do
      before do
        get :new
      end
      it '@userに新しいユーザーを割り当てること' do
        expect(assigns(:user)).to be_a_new(User)
      end
      it '@page_numberが1であること' do
        expect(assigns(:page_number)).to eq 1
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "Post #confirm" do
    let(:params) { { user: user_confirm_hash } }
    let(:params_confirm_invalid) { { user: user_confirm_invalid_hash } }

    context 'sign-in' do
      before do
        login user_login
        post :confirm, params: params
      end
      it "redirect to root_path" do
        expect(response).to redirect_to(root_path)
      end
    end
    context 'sign-out' do
      context 'user valid' do
        before do
          post :confirm, params: params
        end
        it '@userに入力値を割り当てること' do
          expect(assigns(:user)).to have_attributes(user_confirm_hash)
        end
        it '@page_numberが2であること' do
          expect(assigns(:page_number)).to eq 2
        end
        it "renders the :confirm template" do
          expect(response).to render_template :confirm
        end
      end
      context 'user invalid' do
        before do
          post :confirm, params: params_confirm_invalid
        end
        it '@userに入力値を割り当てること' do
          expect(assigns(:user)).to have_attributes(user_confirm_invalid_hash)
        end
        it '@page_numberが1であること' do
          expect(assigns(:page_number)).to eq 1
        end
        it "renders the :new template" do
          expect(response).to render_template :new
        end
      end
    end
  end

  describe "Post #create" do
    let(:params) { { user: user_create_hash } }
    let(:params_create_invalid) { { user: user_create_invalid_hash } }
    context 'sign-in' do
      before do
        login user_login
        post :create, params: params, session: { user_1st_params: user_create_hash }
      end
      it "redirect to root_path" do
        expect(response).to redirect_to(root_path)
      end
    end
    context 'sign-out' do
      context 'user valid' do
        subject {
          post :create,
          params: params,
          session: { user_1st_params: user_create_hash }
        }
        it 'count up user' do
          expect{ subject }.to change(User, :count).by(1)
        end
        it "redirect to new_user_receiver_information_path" do
          subject
          expect(response).to redirect_to(new_user_receiver_information_path(assigns(:user)[:id]))
        end
      end
      context 'user invalid' do
        subject {
          post :create,
          params: params_create_invalid,
          session: { user_1st_params: user_create_invalid_hash }
        }
        it 'not count up user' do
          expect{ subject }.not_to change(User, :count)
        end
        it '@page_numberが2であること' do
          subject
          expect(assigns(:page_number)).to eq 2
        end
        it "render the :confirm" do
          subject
          expect(response).to render_template :confirm
        end
      end
    end
  end

  describe "Get #complete" do
    context 'sign-in' do
      before do
        login user_login
        get :complete
      end
      it '@page_numberが5であること' do
        expect(assigns(:page_number)).to eq 5
      end
      it "renders the :complete template" do
        expect(response).to render_template :complete
      end
    end
    context 'sign-out' do
      before do
        get :complete
      end
      it "redirect to new_user_session_path" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end