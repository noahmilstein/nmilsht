Rails.application.routes.draw do
 resources :posts, only: [:index, :new, :create, :show]

 root "posts#index"
end
