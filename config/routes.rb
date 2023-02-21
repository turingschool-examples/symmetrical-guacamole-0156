Rails.application.routes.draw do
  get "/rooms", to: "rooms#index"

  get "/guests/:id", to: "guests#show"
  post "/guests/:id/guest_rooms", to: "guest_rooms#create"

  get "/hotels/:id", to: "hotels#show"
end
