Rails.application.routes.draw do
  get 'trades/index'
  resources :trades, only: [:index]

  get 'static_pages/root'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "trades#index"

  namespace :charts do
    get "count-by-week-trades"
    get "count-by-month-trades"
    get "average-price-by-week-trades"
    get "average-price-by-month-trades"
    get "volume-weighted-price-by-week-trades"
    get "volume-weighted-price-by-month-trades"
  end
end
