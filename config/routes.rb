Rails.application.routes.draw do
  resources :guests, only: [:show]
end
