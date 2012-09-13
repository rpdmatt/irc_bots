require 'cinch'
require './creds.rb'
Dir["./bots/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.server = Creds.server
    c.password = Creds.password
    c.nick = Creds.nick
    c.channels = Creds.channels
    c.plugins.plugins = [GoogleBot, HelpBot, UrbanDictionary, TinyURL, SlapBot, CowsayBot, OpBot, BeavisBot]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Howdy, #{m.user.nick}!  Type !help for a list of bot commands."
    end
  end

end

bot.start
