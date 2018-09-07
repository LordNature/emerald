require "kemal"
require "./emerald/*"

module Emerald
  get "/" do
    # To-do: Add multiple pages and limit the db fetches
    Post.list
  end

  get "/:id" do |env|
    id = env.params.url["id"]
    Post.query(id)
  end

  get "/:id/:slug" do |env|
    id = env.params.url["id"]
    # Slug is for aesthetic purposes in the url, currently.
    # The purpose of this route is to allow the parameter to be mentioned when linking from the post listings.
    # slug = env.params.url["slug"]
    Post.query(id)
  end

  get "/register" do
    view(register)
  end

  post "/register" do |env|
    user = env.params.body["user"].as(String)
    pass = env.params.body["pass"].as(String)
    Authors.register(user, pass)
    # To-do: Write an error handler & success notification
    # env.redirect "/register"
  end

  get "/login" do
    view(login)
  end

  post "/login" do |env|
    user = env.params.body["user"].as(String)
    pass = env.params.body["pass"].as(String)
    Authors.login(user, pass)
    # To-do: merge login and register into one form
  end
end

Kemal.run
