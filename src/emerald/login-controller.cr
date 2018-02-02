require "remarkdown"
require "crypto/bcrypt"

module Emerald
  class Authors 
    def self.register(user,pass)
	pass = Crypto::Bcrypt::Password.create(pass, cost: 10).to_s
	puts pass
	Emerald::DB.db.exec("INSERT INTO authors (name, hash) VALUES (?, ?)", user, pass)
    end

    def self.login(user,pass)
	id, name, hash = Emerald::DB.db.query_one "SELECT * FROM authors WHERE name = '#{user}'", as: {Int64, String, String}
	#pass = Crypto::Bcrypt::Password.create(pass, cost: 10).to_s
	puts "Clear:" + pass
	puts "Hash:" +  hash
	if(hash == pass)
		return "Success"
	else
		return "YOU FOOL!"
	end
    end
 end
end
