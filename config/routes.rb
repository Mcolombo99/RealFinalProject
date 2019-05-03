Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :chatrooms
  root 'chatrooms#index'
  post '/chatrooms/:id/users', to: 'chatrooms#add_user'
  delete '/chatrooms/:id/users/:user_id', to: 'chatrooms#delete_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
