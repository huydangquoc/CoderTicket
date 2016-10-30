Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy'
  root 'events#index'

  resources :events do
    resources :tickets
  end
end
