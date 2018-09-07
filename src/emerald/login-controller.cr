require "remarkdown"
require "crypto/bcrypt"

module Emerald
  class Authors
    def self.register(user, pass)
      pass = Crypto::Bcrypt::Password.create(pass, cost: 10).to_s
      Emerald::DB.db.exec("INSERT INTO authors (name, hash) VALUES (?, ?)", user, pass)
    end

    def self.login(user, pass)
      id, name, hash = Emerald::DB.db.query_one "SELECT * FROM authors WHERE name = '#{user}'", as: {Int64, String, String}
      hash = Crypto::Bcrypt::Password.new(hash)
      if (hash == pass)
        return "Success"
      else
        return "YOU FOOL!"
      end
    end
  end
end
