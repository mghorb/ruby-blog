Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
    resources :tags
  end

  namespace :api do
    namespace :v1 do
      resources :tags
    end
  end
end

