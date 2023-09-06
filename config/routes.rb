Rails.application.routes.draw do
  resources :accounts, only: [:index, :show, :create, :destroy] do
    member do
      post :create
    end
  end
end
