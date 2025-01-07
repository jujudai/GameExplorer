Rails.application.routes.draw do
  devise_for :users, 
  sign_out_via: [:delete]
  root to: "homes#top"
  get '/homes/about', to: 'homes#about', as: 'about'
end