Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  root "posts#index"

  get '/about', to: 'pages#about'
end
