Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/guests/:id', to: 'guests#show'
  post '/guests/:guest_id/rooms', to: 'room_guests#create'

  get '/rooms', to: 'rooms#index'
end
