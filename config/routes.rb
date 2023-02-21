Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/guests/:id/rooms', to: 'guests#create'
  get '/guests/:id', to: 'guests#show'
end
