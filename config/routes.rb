Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }
  devise_scope :user do
    get "sign_up", :to => "users/registrations#new"
    post "sign_up", :to => "users/registrations#create"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'test#index'
  resources :users, only: [:index, :edit, :update]
end
