Rails.application.routes.draw do
  root "home#index"
  get "/registration", action: "create", controller: "registration"
  resources :users, only: %i[new create show]
end

