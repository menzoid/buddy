Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :categories, only: :show
  resources :events, only: %i[show index] do
    resources :bookings, only: %i[new create index show]
  end
  
  get "bookings/:id/requests/new", to: "requests#new", as: "request"
  get "profile", to: "pages#profile"
  get "dashboard", to: "pages#dashboard"
end
