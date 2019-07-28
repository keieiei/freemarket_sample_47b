Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    post 'users/sign_up/confirm' => 'users/registrations#confirm'
    get 'users/sign_up/complete' => 'users/registrations#complete'
    get 'users/edit_profile' => 'users/registrations#edit_profile'
    post 'users/update_profile' => 'users/registrations#update_profile'
    get 'users/identification' => 'users/registrations#identification'
    post 'users/update_identification' => 'users/registrations#update_identification'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:index, :edit, :update] do
    collection do
      get 'confirm_sign_out'
    end
    resources :receiver_informations, only: [:new, :create, :edit, :update]
    resources :credit_cards, only: [:index, :new, :create, :destroy] do
      collection do
        get 'add'
        post 'add_create'
      end
    end
  end
  resources :items, only: [:index, :new, :create, :show] do
    member do
      get 'buy_confirm'
      patch 'buy'
      get 'buy_complete'
    end
    collection do
      get 'search'
      get 'get_middle_categories', defaults: { format: 'json' }
      get 'get_small_categories', defaults: { format: 'json' }
      get 'get_item_sizes', defaults: { format: 'json' }
    end
  end
  resources :large_categories, only: [:index, :show]
  resources :middle_categories, only: [:show]
  resources :small_categories, only: [:show]
  resources :brands, only: [:show]
  resources :brand_upper_categories, only: [:show]
end
