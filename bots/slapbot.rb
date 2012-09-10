require 'cinch'

class SlapBot
  include Cinch::Plugin

    match /slap (.+)/

    def initialize(*args)
      super
      @slaps = Hash.new
    end

    def execute(m, name)
      unless name == bot.nick
	@slaps.has_key?(name) ? @slaps[name] -= 10 : @slaps[name] = 90
	m.reply("** slaps #{name} **")
	m.reply("** #{name}'s health is #{@slaps[name]} **")
	Channel(@bot.channels.first).kick(name, "Too slapped up.") if @slaps[name] <= 0
      end
    end

end
