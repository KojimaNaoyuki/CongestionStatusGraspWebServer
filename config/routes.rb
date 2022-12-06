Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1 do

    resources :places, only: [:index, :create, :destroy]

    namespace :congestion_data do
      resources :logs, only: [:index]
    end

    resources :congestion_data, only: [:create, :show, :update] do
      collection do
        get :serach
      end
    end

  end
  
end
