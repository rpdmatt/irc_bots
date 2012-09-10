require 'cinch'
Dir["./bots/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "174.98.191.96"
    c.password = "amberjack"
    c.nick = "link"
    c.channels = ["#alaris_villains"]
    c.plugins.plugins = [GoogleBot, HelpBot, UrbanDictionary, TinyURL, SlapBot]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Howdy, #{m.user.nick}!  Type !help for a list of bot commands."
    end
  end

end

bot.start
