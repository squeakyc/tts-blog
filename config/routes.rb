Rails.application.routes.draw do

  resources :comments, :posts, :users
  # each resource was added to this file when we generated the scaffold! Sets up 7 different routes in addition to the ones below (You'll see 8 if you run rails routes `rake routes` in terminal, but patch & put are really the same)
  devise_for :users
  root 'posts#index'

  # the post route sends the user back to the index page once they've filled out the form and pressed Submit.

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/:name' => 'posts#user_posts', as: :user_posts

end
