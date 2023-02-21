Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "guests/:id", to: 'guests#show'

  post "guests/:id/guest_rooms", to: 'guest_rooms#create'

  get "rooms", to: 'rooms#index'

  get "hotels/:id", to: 'hotels#show'
  
end
