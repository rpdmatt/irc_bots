require 'cinch'

class BeavisBot
  include Cinch::Plugin

    match /beavis (.+)/

    def execute(m, phrase)
      m.reply(" " + "_" * phrase.length)
      m.reply("< #{phrase} >")
      m.reply(" " + "-" * phrase.length)
      m.reply("    \\         __------~~-,")
      m.reply("     \\      ,'            ,")
      m.reply("           /               \\")
      m.reply("          /                :")
      m.reply("         |                  '")
      m.reply("         |                  |")
      m.reply("         |                  |")
      m.reply("          |   _--           |")
      m.reply("          _| =-.     .-.   ||")
      m.reply("          o|/o/       _.   |")
      m.reply("          /  ~          \\ |")
      m.reply("         (____@)  ___~    |")
      m.reply("          |_===~~~.`    |")
      m.reply("        _______.--~     |")
      m.reply("        \________       |")
      m.reply("                 \\      |")
      m.reply("               __/-___-- -__")
      m.reply("              /            _ \\")
    end

end
