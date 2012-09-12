require 'cinch'

class CowsayBot
  include Cinch::Plugin

    match /cowsay (.+)/

    def execute(m, phrase)
      m.reply(" " + "_" * phrase.length)
      m.reply("< #{phrase} >")
      m.reply(" " + "-" * phrase.length)
      m.reply("   \   ^__^")
      m.reply("    \  (oo)\_______")
      m.reply("       (__)\       )\/\\")
      m.reply("           ||----w |")
      m.reply("           ||     ||")
    end

end
