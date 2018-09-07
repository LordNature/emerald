require "remarkdown"

module Emerald
  class Post
    ::DB.mapping({
      id:     Int64,
      title:  String,
      author: String,
      hook:   String,
      body:   String,
      date:   Int64,
    })
    JSON.mapping({
      id:     Int64,
      title:  String,
      author: String,
      hook:   String,
      body:   String,
      date:   Int64,
    })

    def self.query(id)
      title, author, hook, body, date = Emerald::DB.db.query_one "SELECT title, author, hook, body, date FROM posts WHERE id = #{id}", as: {String, String, String, String, Int}
      aid = 1
      date = Time.epoch(date).to_s("%B %d, %Y")
      view(post)
    end

    def self.list
      posts = Emerald::DB.db.query_all("SELECT * FROM posts ORDER BY id", as: Post)
      view(blog)
    end
  end
end
