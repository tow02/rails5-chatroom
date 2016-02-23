Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end

  root to: 'rooms#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
