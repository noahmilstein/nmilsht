Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  root "pages#home"

  resources :contacts, only: [:new, :create]
  # post '/contact', to:  'contact#create'
  # get '/contact', to:  'contact#new'

  get '/tags/:tag', to: 'posts#index', as: :tag
  get '/about', to: 'pages#about'
  get '/resume', to: 'pages#resume'
  get '/home', to:  'pages#home'
end
