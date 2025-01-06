Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about', to: 'homes#about', as: 'about' # Aboutページのルーティング

  # 他のルーティング設定もここに追加
end