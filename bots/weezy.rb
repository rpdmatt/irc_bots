require 'nokogiri'
require 'open-uri'
require 'cinch'

class Weezy 
	include Cinch::Plugin

		match /weezy/

		def execute(m)
		url = "http://www.metrolyrics.com/lil-wayne-lyrics.html"

		doc = Nokogiri::HTML(open(url))
		count = 0
		a = Array.new
		doc.css(".song").each do |item|
			a.push 'http://www.metrolyrics.com' + item.at_css("a")[:href]
		end

		r = (rand()*a.length).to_i + 1
		#puts r
		#puts r
		#puts a.length

		newdoc = Nokogiri::HTML(open(a[r]))
		b = Array.new
		lyricdoc = newdoc.xpath(".//div[@id='lyrics-body']/p")


	  lyric =	lyricdoc.xpath(".//span[count(preceding::br)=#{rand(lyricdoc.xpath(".//br").length)}]")

    if lyric != []
			lyric[0..6].each {|item| m.reply(item.text)}
    else
      lyricdoc.xpath(".//span[count(preceding::br)=#{rand(lyricdoc.xpath(".//br").length)}]")[0..6].each { |line| m.reply line.to_s }
		end

		end
	end
