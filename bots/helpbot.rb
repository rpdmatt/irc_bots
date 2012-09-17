require 'cinch'

class HelpBot
  include Cinch::Plugin

    match /help/

    def execute(m)
      m.reply("!google [query] - Get link to first google result for query")
      m.reply("!urban [word] - Get defintion from urban dictionary")
      m.reply("!slap [user] - Slap a user")
      m.reply("!heal [user] - Heal a user")
      m.reply("!hp - Get your current hp")
      m.reply("!cowsay [something] - Make a cow say something!")
      m.reply("!beavis [something] - Make beavis say something!")
      m.reply("!roulette - Play russian roulette!")
    end

end
