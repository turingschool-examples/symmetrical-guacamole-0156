Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/guests/:id", to: "guests#show"

  get "/rooms", to: "rooms#index"
  post "/guests/:id/rooms", to: "rooms#create"
end
