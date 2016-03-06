Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
    resources :health_cares, only: [:create, :update] do
      get :history, on: :collection
      get :infirmity, on: :collection
    end
   end
  end
end
