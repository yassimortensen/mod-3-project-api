Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :story_stages, only: [:create, :index]
      resources :user_stories, only: [:create, :index] 
      resources :users, only: [:create, :index]
      resources :pics, only: [:create, :index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
