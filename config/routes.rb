Rails.application.routes.draw do
 resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
 end

 root "posts#index"
end
