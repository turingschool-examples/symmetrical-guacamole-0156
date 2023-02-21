Rails.application.routes.draw do
  get "/guests/:id", to: "guests#show"
end
