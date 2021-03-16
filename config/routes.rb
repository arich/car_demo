Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    defaults format: :json do
      resources :brands, only: %i[create index]
      resources :cars, only: %i[create index]
    end
  end
end
