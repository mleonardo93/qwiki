Rails.application.routes.draw do
  get 'charges/create'
  get 'wikis/index'
  get 'wikis/show'
  get 'wikis/new'
  get 'wikis/edit'
  devise_for :users
  get 'home/index'
  get 'home/about'
  resources :wikis
  root to: "home#index"
  resources :charges, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
