Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
