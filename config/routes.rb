Rails.application.routes.draw do
  devise_for :users, 
  sign_out_via: [:delete]
  root to: "homes#top"
  get '/homes/about', to: 'homes#about', as: 'about'

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: [:show]
end