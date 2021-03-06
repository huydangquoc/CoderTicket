Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create]
  resources :venues

  post 'publish/:id' => 'events#publish', :as => :publish_event
  delete '/logout' => 'sessions#destroy'
  root 'events#index'

  resources :events do
    collection do
      get :unpublished
      get :published
    end
    resources :tickets
    resources :ticket_types
  end
end
