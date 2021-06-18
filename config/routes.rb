Rails.application.routes.draw do
  devise_for :users,controllers:{
    registrations: "users/registrations",
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
