Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#home'
  get '/home/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
end
