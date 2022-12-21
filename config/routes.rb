Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: %i[index new create destroy]
  resource :session, only: %i[new create destroy]
  resources :places, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'breweries#index'
  get 'kaikki_bisset', to: 'beers#index'
  get 'ratings', to: 'ratings#index'
  get 'ratings/new', to: 'ratings#new'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  post 'ratings', to: 'ratings#create'
  post 'places', to: 'places#search'
end
