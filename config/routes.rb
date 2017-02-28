Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "static_pages#index"
  get 'about/', to: "static_pages#about"
  resources :vehicles, only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :species, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :films, only: [:index, :show]
end
