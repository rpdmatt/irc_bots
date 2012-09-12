require 'open-uri'
require 'cinch'

class TinyURL
  include Cinch::Plugin

  listen_to :channel

  def shorten(url)
    url = open("http://tinyurl.com/api-create.php?url=#{URI.escape(url)}").read
    url == "Error" ? nil : url
  rescue OpenURI::HTTPError
    nil
  end

  def listen(m)
    urls = URI.extract(m.message, "http")
    if urls.to_s.length > 30
      short_urls = urls.map { |url| shorten(url) }.compact
      unless short_urls.empty?
        m.reply "How about a shorter url?"
        m.reply short_urls.join(", ")
      end
    end
  end
end
