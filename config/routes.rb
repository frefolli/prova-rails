Rails.application.routes.draw do
  resources :accounts, only: [:index, :show, :create, :destroy]
end
