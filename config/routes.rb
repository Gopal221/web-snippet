Rails.application.routes.draw do
  devise_for :users
   devise_scope :user do
    authenticated :user do
      root 'welcome#snippet'
    end
    unauthenticated do
      get '/',to: 'welcome#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
    	resources :registrations,:only => [:create]
      resources :sessions, :only => [:create, :destroy]
      resources :snippet
      resources :permission
      resources :user do
      	collection do
          post :create_token
        end
      end
    end
  end
end
