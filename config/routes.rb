Rails.application.routes.draw do
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users do
    resources :food_stocks, shallow: true
    resources :food_consumes, shallow: true
  end
  get '/templates/get_body', to: "templates#get_body"
end