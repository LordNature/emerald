# require "active_record"
# require "active_record/null_adapter"
module Emerald
  class Post
    def self.query(id)
      title, author, hook, body, date = Emerald::DB.db.query_one "SELECT title, author, hook, body, date FROM posts WHERE id = #{id}", as: {String, String, String, String, Int}
      date = Time.epoch(date).to_s("%B %d, %Y")
      render "src/views/post.ecr", "src/views/layout.ecr"
    end
  end
end
