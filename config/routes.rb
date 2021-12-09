Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :categories, only: :show
  resources :events, only: %i[show index new create] do
    resources :bookings, only: %i[new create index]
  end
  resources :bookings, only: %i[show] do
    resources :requests, only: %i[new create]
  end

  resources :requests, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end

  resources :chatrooms, only: %i[index show] do
    resources :chatroom_users, only: :create
    resources :messages, only: :create
  end

  resources :profiles, only: %i[new create edit update]

  get "dashboard", to: "pages#dashboard"
  get "welcome", to: "pages#welcome"
end
