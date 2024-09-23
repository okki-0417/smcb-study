Rails.application.routes.draw do
  root "login_sessions#new"
  resources :users
  resource :login_session, only: [ :new, :create, :destroy ]
end
