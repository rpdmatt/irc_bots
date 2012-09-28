require 'cinch'
require './creds.rb'
Dir["./bots/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.port = Creds.port
    c.server = Creds.server
    c.password = Creds.password
    c.nick = Creds.nick
    c.channels = Creds.channels
    c.plugins.plugins = [TBS]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Have you seen Han Solo?"
    end
  end

end

bot.start
