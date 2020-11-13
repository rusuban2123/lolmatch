Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :users
  resources :messages
  resources :rooms
  resources :relationships
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
