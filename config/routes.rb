Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  root "pages#home"

  get '/about', to: 'pages#about'
  get '/resume', to: 'pages#resume'
  get '/home', to:  'pages#home'
  get '/contact', to:  'pages#contact'

end
