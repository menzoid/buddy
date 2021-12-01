Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :categories, only: :show
  resources :events, only: %i[show index] do
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

  resources :chatrooms, only: %i[index show]

  get "profile", to: "pages#profile"
  get "dashboard", to: "pages#dashboard"

  resources :search_by_name, only: [:index]
end
