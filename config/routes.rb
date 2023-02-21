Rails.application.routes.draw do

  get '/guests/:id', to: 'guests#show'

  post '/guest_rooms/:id', to: 'guest_rooms#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
