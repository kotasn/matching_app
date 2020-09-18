Rails.application.routes.draw do
  get 'user/index'
  get 'user/show'
  get 'user/follow_list', to: 'user#follow_list'
  devise_for :users
  root to: "top#index"
  get 'top/index'
  get 'top/show'
  resources :relationships, only: [:create, :destroy]
end
