require_relative "api/version"
require "google/apis/customsearch_v1"
require "net/http"
require "json"
require "sinatra"

get '/' do
	'Hello world'
end

# get '/search/:word' do |keyword|
# 	Endpoint = Google::Apis::CustomsearchV1
# 	search_client = Endpoint::CustomsearchService.new
# 	search_client.key = "AIzaSyApBGCqcbAHYMyeqFY9ZEGIfJFgRgN-5us"
# 	response = search_client.list_cses("#{keyword}", { cx: "008044896334911258708:ccwdhgnhqge", fields: "items" })
# 	status, headers, body = response
# 	items = status.to_json
# end


get '/search/:word', :provides => [:json, :xml] do |keyword|
	uri = URI.parse(URI.encode("http://www.google.com/search?q=#{keyword}"))
	#url = URI("http://www.googleapis.com/customsearch/v1?key=AIzaSyApBGCqcbAHYMyeqFY9ZEGIfJFgRgN-5us&cx=008044896334911258708:ccwdhgnhqge&q=#{keyword}")
	#uri = URI.parse(URI.encode("http://api.giphy.com/v1/gifs/search?q=#{keyword}&api_key=dc6zaTOxFJmzC"))

	# Net::HTTP.get_response(url) do |response|
 #    open 'large_file', 'w' do |io|
 #      response.read_body do |chunk|
 #        io.write chunk
 #      end
 #    end
 #  end

	api_response = Net::HTTP.get(uri)
	#JSON.parse(api_response)
	api_response

	#api_response_hash = Hash.from_xml(api_reponse).to_json

end

module Ruby
	module Api
		class Error < StandardError; end
    # Your code goes here...

    # class Server < Sinatra::Base
    # 	get '/' do
    # 		'Hello world'
    # 	end	
    # end

  end
end
