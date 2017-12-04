Rails.application.routes.draw do
  resources :story_stages
  resources :user_stories
  resources :users
  resources :pics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
