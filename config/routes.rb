Rails.application.routes.draw do
  resources :comments
  # resources :post was added to this file when we generated the scaffold! Sets up 7 different routes in addition to the ones below (You'll see 8 if you run rails routes in terminal, but patch & put are really the same)
  resources :posts
  get 'index' => 'practice#index'
  post 'index' => 'practice#index'
  # the post route sends the user back to the index page once they've filled out the form and pressed Submit.
  get 'about' => 'practice#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
