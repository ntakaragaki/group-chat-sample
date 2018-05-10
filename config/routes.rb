Rails.application.routes.draw do
  get 'chats/index'

  root   'sessions#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'

  resources :groups, only: [] do
    resources :chat, only: [:index]
  end
end
