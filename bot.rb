require 'cinch'
Dir["./bots/*.rb"].each { |file| require file }

## Get login credentials for IRC
file = File.open("creds.txt", "r")
credentials = file.read.delete!("\n")
username = credentials.split("::")[0]
password = credentials.split("::")[1]

bot = Cinch::Bot.new do
  configure do |c|
    c.server = username
    c.password = password
    c.nick = "link"
    c.channels = ["#alaris_villains"]
    c.plugins.plugins = [GoogleBot, HelpBot, UrbanDictionary, TinyURL, SlapBot, CowsayBot, OpBot]
  end

  ["hello", "hey", "hi", "howdy"].each do |greeting|
    on :message, greeting do |m|
      m.reply "Howdy, #{m.user.nick}!  Type !help for a list of bot commands."
    end
  end

end

bot.start
