Rails.application.routes.draw do

devise_for :users
resources :users , only: [:mypage, :create, :show, :edit, :destroy, :update] do
  member do get "mypage"
end
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
end
