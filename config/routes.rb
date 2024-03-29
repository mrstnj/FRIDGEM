Rails.application.routes.draw do
  root "static_pages#home"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users do
    resources :food_stocks
    resources :food_consumes
    get    "/calender",   to: "food_consumes#calender"
  end
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get '/templates/get_body', to: "templates#get_body"
end