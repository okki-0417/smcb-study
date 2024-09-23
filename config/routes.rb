Rails.application.routes.draw do
  root "loogin_sessions#new"
  resources :users
  resource :login_session, only: [ :new, :create, :destroy ]
end
