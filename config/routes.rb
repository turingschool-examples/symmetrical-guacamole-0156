Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/guests/:guest_id', to: 'guests#show'

  post '/guest_rooms/:guest_id', to: 'guest_rooms#create'

  get '/rooms', to: 'rooms#index'
end
