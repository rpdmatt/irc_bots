require 'cinch'

class AsciiBot
  include Cinch::Plugin

    match /beavis (.+)/i, method: :beavis
    match /windoze/i, method: :windoze
    match /roll/i, method: :roll

    def beavis(m, phrase)
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

    def windoze(m)
     m.reply("        _.-;;-._")
     m.reply(" '-..-'|   ||   |")
     m.reply(" '-..-'|_.-;;-._|")
     m.reply(" '-..-'|   ||   |")
     m.reply(" '-..-'|_.-''-._|")
    end

    def roll(m)
      m.reply("♫ ♪♩ Never gonna give you op ♩♪♫")
      m.reply("♫ ♪♩ Never gonna let you down ♩♪♫")
      m.reply("♫ ♪♩ Never gonna run around ♩♪♫")
      m.reply("♫ ♪♩ And let you kiicckk me! ♩♪♫")
    end

end
