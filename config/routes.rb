Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

devise_for :admins
devise_for :users
resources :users, only: [:index, :show, :edit, :update, :destroy] do
  member do
    get :follows, :followers
    get :mypage
  end
  resource :relationships, only: [:create, :destroy]
end

resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end



resources :maps
get "maps/new"
 resources :maps do
    resources :comments, only: [:create, :destroy]
  end
get "search" => "searches#search"

root to: 'homes#about'
get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
delete 'users/:id/withdraw' => 'users#withdraw', as:'withdraw_user'
resources :maps do
  resource :favorite, only: [:create, :destroy]  # 単一の「お気に入り」にするためresourceを使用
end
end
