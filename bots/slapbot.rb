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
      unless name == bot.nick
	@slaps.has_key?(name) ? @slaps[name] -= 10 : @slaps[name] = 90
	m.reply("** slaps #{name} **")
	m.reply("** #{name}'s health is #{@slaps[name]} **")
        if @slaps[name] <= 0
	  Channel(@bot.channels.first).kick(name, "Too slapped up.")
          @slaps.delete(name)
        end
      end
    end

    def heal(m, name)
      unless name == m.user.nick
	if @slaps.has_key?(name) && @slaps[name] < 100
          @slaps[name] += 10
	  m.reply("** heals #{name} **")
	  m.reply("** #{name}'s health is #{@slaps[name]} **")
        end
      end
    end

    def hp(m, name)
      if @slaps.has_key?(name)
        m.reply("** #{name}'s hp is #{@slaps[name]} **")
      else
        m.reply("** #{name}'s hp is 100 **")
      end
    end
end
