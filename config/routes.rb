Rails.application.routes.draw do
  root "home#index"
  resources :users, only: %i[new create show]
end

