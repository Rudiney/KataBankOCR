class DisplayInterface

  attr_accessor :screen, :digits

  def self.from_screen(screen)
    me = self.new
    me.parse_screen(screen)
    return me
  end

  def parse_screen(screen)
    require 'pry'; binding.pry
  end
end