Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1 do

    resources :places, only: [:index, :create, :destroy]

    resources :congestion_datum, only: [:create, :show, :update] do
      collection do
        get :serach
      end
    end

    resources :congestion_datum_logs, only: [:index]

  end
  
end
