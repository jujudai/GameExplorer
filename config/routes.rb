Rails.application.routes.draw do
  get 'top' => 'homes#top'       # トップページをルートに設定
  get 'about', to: 'homes#about', as: 'about' # Aboutページのルーティング

  # 他のルーティング設定もここに追加
end