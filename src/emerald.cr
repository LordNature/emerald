require "markdown"
require "kemal"
require "./emerald/*"

module Emerald
	get "/" do |env|
		Emerald::DB.db.query("SELECT * FROM posts") do |rs|
			rs.each do
				id = rs.read(Int64)
				title = rs.read(String)
				author = rs.read(String)
				hook = rs.read(String)
				body = rs.read(String)
				date = rs.read(Int)


				env.response.puts("#{id} #{title} #{author} #{hook} #{body} #{date}")
			end
		end
	end

	get "/blog/:id" do |env|
		id = env.params.url["id"]
		render "src/views/blog.ecr"
	end
end

Kemal.run
