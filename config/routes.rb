Rails.application.routes.draw do
  resources :charts
  get 'static_pages/root'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "static_pages#root"
end
