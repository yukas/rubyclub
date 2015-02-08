Rails.application.routes.draw do
  get "/about", to: "rubyclub#about", as: "about"
  
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
  post "/sessions", to: "sessions#create"
  
  resources :articles

  root "articles#index"
end
