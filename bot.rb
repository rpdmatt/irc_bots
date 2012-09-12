require 'cinch'
Dir["./bots/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    c.server = ""
    c.password = ""
    c.nick = "link"
    c.channels = ["#alaris_villains"]
    c.plugins.plugins = [GoogleBot, HelpBot, UrbanDictionary, TinyURL, SlapBot, CowsayBot]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Howdy, #{m.user.nick}!  Type !help for a list of bot commands."
    end
  end

end

bot.start
