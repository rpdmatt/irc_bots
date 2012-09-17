require 'cinch'

class RouletteBot
  include Cinch::Plugin

    match /roulette/, method: :roulette

    def initialize(*args)
      super
      @results = Hash.new
    end

    def roulette(m)
      if Random.rand(6) == 5
        Channel(m.channel).kick(m.user.nick, "Lost russian roulette.")
        @results.delete(m.user.nick.downcase)
      else 
        m.reply("** #{m.user.nick} survived russian roulette **")
        @results.has_key?(m.user.nick.downcase) ? @results[m.user.nick.downcase] += 1 : @results[m.user.nick.downcase] = 1
        m.channel.op(m.user.nick) if @results[m.user.nick.downcase] == 12
      end
    end

end
