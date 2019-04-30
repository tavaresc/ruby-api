require_relative "api/version"
require "sinatra"

module Ruby
	module Api
		class Error < StandardError; end
    # Your code goes here...

    class Server < Sinatra::Base
    	get '/' do
    		'Hello world'
    	end	
    end
  end
end
