Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  devise_scope :user do
    post 'users/sign_up/confirm' => 'users/registrations#confirm'
    get 'users/sign_up/complete' => 'users/registrations#complete'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'confirm_sign_out'
    end
    resources :receiver_informations, only: [:new, :create, :edit, :update]
    resources :credit_cards, only: [:new, :create, :edit, :update]
  end
  resources :items, only: [:index, :new, :create]
end
