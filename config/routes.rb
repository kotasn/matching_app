Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  root to: "top#index"
  get 'top/index'
  get 'top/show'
end
