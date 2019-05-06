require "byebug"
require "nokogiri"

module Utils

	def extract_links #(source_code)
		# uri = URI.parse(URI.encode("http://www.google.com/search?q=capybara"))
		# api_response = Net::HTTP.get(uri)
		# File.new("html_file", "w+").write(api_response)

		uri = "http://www.google.com/search?q=capybara"
		html_doc = Nokogiri::HTML(open(uri))
		index = 0

		hash_result = Hash.new
		results = html_doc.xpath("//div[@id='ires']/ol/div/h3")

		byebug

		results.each do |res|
			hash_result << { "href" => res.xpath("//a/@href"), "description" => res.xpath("//span").text }
		end

		#p "hello"
		p hash_result
		#results.each { |r| p r }
	end

end