Rails.application.routes.draw do

  get '/guests/:id', to: 'guests#show'

  post '/guests/:id/guest_rooms', to: 'guest_rooms#create'

  get '/rooms', to: 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
