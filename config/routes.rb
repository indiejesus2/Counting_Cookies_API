Rails.application.routes.draw do
  
  root to: 'api/v1/users#index'
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/sign_up', to: 'users#create'
      # delete '/sign_out', to: 'auth#destroy'
      resources :users do
        resources :records do
          resources :days
        end
      end
    end
  end
  
      
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
