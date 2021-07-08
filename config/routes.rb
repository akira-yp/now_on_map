Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'events#index'
  devise_for :users,controllers:{
    registrations: "users/registrations",
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to:'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to:'users/sessions#guest_admin_sign_in'
  end
  resources :users do
    member do
      get :mypage
      get :posts_index
    end
  end
  resources :events do
    collection do
      get '/hashtag/:name', to:'events#hashtag'
      get 'search', to:'events#search'
    end
  end
  resources :comments, only:[:index, :new, :create, :destroy]
  resources :favorites, only:[:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
