Rails.application.routes.draw do
  get '/guests/:id', to: 'guests#show'
  post "/guests/:id/room_guests", to: "room_guests#create"
end
