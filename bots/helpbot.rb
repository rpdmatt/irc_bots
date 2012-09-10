require 'cinch'

class HelpBot
  include Cinch::Plugin

    match /help/

    def execute(m)
      m.reply("!google [query] - Get link to first google result for query")
      m.reply("!urban [word] - Get defintion from urban dictionary")
    end

end
