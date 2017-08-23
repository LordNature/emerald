require "kemal"
require "./emerald/*"

module Emerald
	get "/" do
		"Hello!"
	end
end

Kemal.run
