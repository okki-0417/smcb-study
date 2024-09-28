Rails.application.routes.draw do
  root "users#new"
  resource :mypage, only: [ :show ]
  resources :users
  resource :login_session, only: [ :new, :create, :destroy ]
end
