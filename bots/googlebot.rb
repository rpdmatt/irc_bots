require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

class GoogleBot
  include Cinch::Plugin

    match /google (.+)/

    def execute(m, query)
      m.reply(google(query))
    end

    def google(query)
      url = "http://www.google.com/search?q=#{CGI.escape(query)}"
      res = Nokogiri::HTML(open(url)).at("h3.r")

      title = res.text
      link = res.at('a')[:href]
      link = link.slice(link.index("http")..link.index("&sa")-1)
      desc = res.at("./following::div").children.first.text
      rescue
	"No results found"
      else
	CGI.unescape_html "#{title} (#{link})"
    end
end
