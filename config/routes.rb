Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static_pages#index'
  get 'about/', to: 'static_pages#about'
  get 'test_ajax/', to: 'static_pages#test_ajax'
  get 'people_ajax/', to: 'people#people_ajax'
  get 'planets_ajax/', to: 'planets#planets_ajax'
  resources :vehicles, only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :species, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :films, only: [:index, :show]
end
