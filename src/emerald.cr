require "markdown"
require "kemal"
require "./emerald/*"

module Emerald
  get "/" do |env|
    render "src/views/blog.ecr", "src/views/layout.ecr"
  end

  get "/blog/:id/:slug" do |env|
    id = env.params.url["id"]
    # Slug is for aesthetic purposes in the url, currently.
    # slug = env.params.url["slug"]
    render "src/views/post.ecr", "src/views/layout.ecr"
  end

  get "/:id" do |env|
    id = env.params.url["id"]
    Post.query(id)
  end

  get "/test" do |env|
    # def seo_friendly(str)
    # str.strip.downcase.gsub /\W+/, '-'
    # end
    test = "John is a very stupid person"
    test2 = test.strip.downcase.gsub /\W+/, '-'
    "<b>Before Slug:</b> #{test} <br> <b>After Slug:</b> #{test2}"
  end
end

Kemal.run
