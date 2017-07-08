Rails.application.routes.draw do
  root "home#index"
  get 'home/index'

  match "home/search", to: "home#search", via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
