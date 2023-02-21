Rails.application.routes.draw do
  get "/guests/:id", to: "guests#show"
  # patch "/guests/:id", to: "guests#update"
  post "/guests/:id/rooms", to: "guest_rooms#create"

  get "/rooms", to: "rooms#index"
end
