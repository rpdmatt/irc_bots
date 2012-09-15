require 'cinch'

class SlapBot
  include Cinch::Plugin

    match /slap (.+)/, method: :slap
    match /heal (.+)/, method: :heal
    match /hp/, method: :hp

    def initialize(*args)
      super
      @slaps = Hash.new
    end

    def slap(m, name)
      if name != bot.nick && m.channel.has_user?(name)
        @slaps.has_key?(name.downcase) ? @slaps[name.downcase] -= 10 : @slaps[name.downcase] = 90
        m.reply("** slaps #{name} **")
        m.reply("** #{name}'s health is #{@slaps[name.downcase]} **")
        if @slaps[name.downcase] <= 0
          Channel(m.channel).kick(name, "Too slapped up.")
          @slaps.delete(name.downcase)
        end
      end
    end

    def heal(m, name)
      if name != bot.nick && m.channel.has_user?(name)
        if @slaps.has_key?(name.downcase) && @slaps[name.downcase] < 100
          @slaps[name.downcase] += 10
          m.reply("** heals #{name} **")
          m.reply("** #{name}'s health is #{@slaps[name.downcase]} **")
        end
      end
    end

    def hp(m)
      if @slaps.has_key?(m.user.to_s.downcase)
        m.reply("** #{m.user}'s hp is #{@slaps[m.user.to_s.downcase]} **")
      else
        m.reply("** #{m.user}'s hp is 100 **")
      end
    end
end
