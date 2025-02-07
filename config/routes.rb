Rails.application.routes.draw do
  
  get 'users/show'
  devise_for :users, sign_out_via: [:delete]
  root to: "homes#top"
  get '/homes/about', to: 'homes#about', as: 'about'
  get '/users/:id', to: 'users#show', as: 'user'

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
  sessions: 'admin/sessions'}
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    root to: 'dashboards#index'
    resources :users, only: [:index, :show,:edit, :update, :destroy]
    resources :games, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:show]
end