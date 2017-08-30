require "markdown"
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
end

Kemal.run
