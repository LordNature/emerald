require "markdown"
require "kemal"
require "./emerald/*"

module Emerald
	get "/" do |env|
		render "src/views/blog.ecr", "src/views/layout.ecr"
	end

	get "/blog/:id" do |env|
		id = env.params.url["id"]
		render "src/views/post.ecr", "src/views/layout.ecr"
	end
end

Kemal.run
