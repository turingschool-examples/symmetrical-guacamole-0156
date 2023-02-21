Rails.application.routes.draw do

  get "/guests/:id", to: "guests#show"

  post "/guests/:id/rooms", to: "room#create"
end
