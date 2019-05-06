require "byebug"
require "nokogiri"

module Utils

	def extract_links #(source_code)
		# uri = URI.parse(URI.encode("http://www.google.com/search?q=capybara"))
		# api_response = Net::HTTP.get(uri)
		# File.new("html_file", "w+").write(api_response)

		uri = "http://www.google.com/search?q=capybara"
		html_doc = Nokogiri::HTML(open(uri))

		result_list = []
		results = html_doc.xpath("//div[@id='ires']/ol/div/h3")

		#byebug

		results.each do |res|
			result_list.push({ "href" => res.xpath("./a/@href").text, "description" => res.xpath("../div[@class='s']/span").text })
		end

		p result_list
	end

end