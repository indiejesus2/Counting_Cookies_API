Rails.application.routes.draw do
  
  root to: 'homepage#index'
  namespace :api do
    namespace :v1 do

      # delete '/sign_out', to: 'auth#destroy'
      resources :users do
        resources :records do
          resources :days
        end
      end
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/sign_up', to: 'users#create'
    end
  end
  
      
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
