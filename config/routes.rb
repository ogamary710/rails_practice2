Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  #resources :books
  root 'home#top'
  get 'home/about'

  resources :books, only: [:new, :create, :index, :show] do
    resource :post_comments, only: [:create, :destroy]
  end
end
