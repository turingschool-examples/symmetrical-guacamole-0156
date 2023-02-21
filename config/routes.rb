Rails.application.routes.draw do
  resources :guests, only: [:show]
  patch '/guests/:id', to: 'guests#update'
end
