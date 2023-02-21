Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hotels/:id', to: 'hotels#show'
  
  get '/guests/:id', to: 'guests#show'

  get '/rooms', to: 'rooms#index'

  post 'guests/:id/guest_rooms', to: 'guest_rooms#create'
end
