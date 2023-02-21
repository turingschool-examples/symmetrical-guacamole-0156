Rails.application.routes.draw do
  resources :rooms, only: [:index]

  resources :guests, only: [:show]
  patch '/guests/:id', to: 'guests#update'
end
