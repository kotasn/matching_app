Rails.application.routes.draw do
  get 'user/index'
  get 'user/show'
  devise_for :users
  root to: "top#index"
  get 'top/index'
  get 'top/show'
  resources :relationships, only: [:create, :destroy]
end
