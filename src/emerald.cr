require "./emerald/*"
require "kemal"

module Emerald
	get "/" do
		"Hello!"
	end
end

Kemal.run
