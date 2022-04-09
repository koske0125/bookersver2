Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#home'
  get '/home/about' => 'homes#about'
  resource :users, only: [:show, :edit, :update]
  resource :books, only: [:create, :index, :show, :destroy, :edit]
end
