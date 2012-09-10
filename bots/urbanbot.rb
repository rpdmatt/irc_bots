require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

class UrbanDictionary
  include Cinch::Plugin

  match /urban (.+)/
  def lookup(word)
    url = "http://www.urbandictionary.com/define.php?term=#{CGI.escape(word)}"
    CGI.unescape_html Nokogiri::HTML(open(url)).at("div.definition").text.gsub(/\s+/, ' ') rescue nil
  end

  def execute(m, word)
    m.reply(" #{word} - #{lookup(word)}" || "No results found", true)
  end
end


