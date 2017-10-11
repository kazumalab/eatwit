Rails.application.routes.draw do
  root "home#index"
  get "/registration", action: "create", controller: "registration"
  get "/login", action: "new", controller: "session"
  post "/login", action: "create", controller: "session"
  resources :users, only: %i[new create show]
end

