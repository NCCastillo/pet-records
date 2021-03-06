Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root "dashboard#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new"
  end

  resources :pets, only: [:new, :create]
  resources :appointments, only: [:new, :create]
  resources :veterinarians, only: [:new, :create]
end
