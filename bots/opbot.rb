require 'cinch'

class OpBot
  include Cinch::Plugin
    match /op/

    def execute(m)
      m.channel.op("n1p") 
    end
end
