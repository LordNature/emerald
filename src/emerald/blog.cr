module Emerald
	get "/blog" do
		"Blog Entries"
	end

	get "blog/:id" do |env|
		id = env.params.url["id"]
		#TODO Setup a real DB
		db = File.open("src/db.txt", "r")
		render "src/views/blog.ecr"
