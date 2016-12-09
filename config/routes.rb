Rails.application.routes.draw do
 resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]

 root "posts#index"
end
