Rails.application.routes.draw do
  resources :reservations do
    member do
      get 'finished' => "reservations#finished"
    end
  end
  devise_for :users
  root to: "home#index"
  resources:users
  resources :rooms do
    collection do
      get 'search' => "rooms#search"
    end
  end
end
