Rails.application.routes.draw do
  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------


  root "posts#my_posts"
  # Routes for the Post resource:
  # CREATE
  get "/posts/new", :controller => "posts", :action => "new"
  post "/create_post", :controller => "posts", :action => "create"

  # READ
  get "/posts", :controller => "posts", :action => "index"
  get "/my_posts", :controller => "posts", :action => "my_posts"
  get "/posts/:id", :controller => "posts", :action => "show"

  # UPDATE
  get "/posts/:id/edit", :controller => "posts", :action => "edit"
  post "/update_post/:id", :controller => "posts", :action => "update"

  # DELETE
  get "/delete_post/:id", :controller => "posts", :action => "destroy"
  #------------------------------

  # Routes for the Message resource:
  # CREATE
  get "/messages/new", :controller => "messages", :action => "new"
  post "/create_message", :controller => "messages", :action => "create"

  # READ
  get "/messages", :controller => "messages", :action => "index"
  get "/messages/:id", :controller => "messages", :action => "show"

  # UPDATE
  get "/messages/:id/edit", :controller => "messages", :action => "edit"
  post "/update_message/:id", :controller => "messages", :action => "update"

  # DELETE
  get "/delete_message/:id", :controller => "messages", :action => "destroy"
  #------------------------------

  # Routes for the Connection resource:
  # CREATE
  get "/connections/new", :controller => "connections", :action => "new"
  post "/create_connection", :controller => "connections", :action => "create"

  # READ
  get "/connections", :controller => "connections", :action => "index"
  get "/connections/:id", :controller => "connections", :action => "show"

  # UPDATE
  get "/connections/:id/edit", :controller => "connections", :action => "edit"
  post "/update_connection/:id", :controller => "connections", :action => "update"

  # DELETE
  get "/delete_connection/:id", :controller => "connections", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"

  get "/users/:id", :controller => "users", :action => "show"
  get "/my_follows", :controller => "users", :action => "my_friends"
  post "/go_to_user", :controller => "users", :action => "go_to_user"
end
