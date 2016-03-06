Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :health_cares, only: [:index] do
        get :history, on: :collection
      end

      resources :locales, only: [:index] do
        post :health_cares, on: :member
      end

    end
  end
end
