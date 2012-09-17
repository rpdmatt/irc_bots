require 'cinch'

class RouletteBot
  include Cinch::Plugin

    match /roulette/, method: :roulette

    def roulette(m)
      Random.rand(6) == 5 ? Channel(m.channel).kick(m.user.nick, "Lost russian roulette.") : m.reply("** #{m.user.nick}survived russian roulette **")
    end

end
