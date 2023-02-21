Rails.application.routes.draw do
  get "/guests/:id", to: "guests#show"
  patch "/guests/:id", to: "guests#update"

  get "/rooms", to: "rooms#index"
end
