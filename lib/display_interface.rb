class DisplayInterface

  DIGITS_MAP = {
    " _ "+
    "| |"+
    "|_|" => 0,
    "   "+
    "  |"+
    "  |" => 1,
    " _ "+
    " _|"+
    "|_ " => 2,
    " _ "+
    " _|"+
    " _|" => 3,
    "   "+
    "|_|"+
    "  |" => 4,
    " _ "+
    "|_ "+
    " _|" => 5,
    " _ "+
    "|_ "+
    "|_|" => 6,
    " _ "+
    "  |"+
    "  |" => 7,
    " _ "+
    "|_|"+
    "|_|" => 8,
    " _ "+
    "|_|"+
    " _|" => 9
  }

  attr_accessor :screen, :digits

  def self.from_screen(screen)
    me = self.new
    me.parse_screen(screen)
    return me
  end

  def parse_screen(screen)
    screen_lines = screen.split("\n")
    raise 'Im expected 4 lines' unless screen_lines.size == 4
    screen_lines.pop #ignore the 4th line
    self.digits = []

    9.times do |i|
      digit_columns = (i*3)..(i*3+2)

      digit = screen_lines[0][digit_columns]
      digit << screen_lines[1][digit_columns]
      digit << screen_lines[2][digit_columns]

      self.digits << DIGITS_MAP[digit]
    end
  end
end