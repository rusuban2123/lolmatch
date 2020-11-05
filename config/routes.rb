Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  resources :tops
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
