module Emerald
	get "/blog" do
		"Blog Entries"
	end

	get "blog/:id" do |env|
		id = env.params.url["id"]
		#TODO Setup DB
		render "src/views/blog.ecr"
