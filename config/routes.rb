Rails.application.routes.draw do
  get 'collaborators/create'
  get 'collaborators/edit'
  get 'subscriptions/upgrade'
  get 'subscriptions/downgrade'
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
  resources :collaborators, only: [:new, :create, :edit, :destroy]
  get 'upgrade', to: 'subscriptions#upgrade'
  get 'downgrade', to: 'subscriptions#downgrade'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
