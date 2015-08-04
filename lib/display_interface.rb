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

  def self.parse_file(file_content)
    lines = file_content.split("\n").in_groups_of(4)
    lines.map do |screen_line|
      self.from_screen(screen_line.join("\n"))
    end
  end

  def parse_screen(screen)
    screen_lines = screen.split("\n")
    raise 'Im expected at least 3 lines' if screen_lines.size < 3
    screen_lines.pop if screen_lines.size == 4  #ignore the 4th line
    self.digits = []

    9.times do |i|
      digit_columns = (i*3)..(i*3+2)

      digit = screen_lines[0][digit_columns] || []
      digit << screen_lines[1][digit_columns]
      digit << screen_lines[2][digit_columns]

      self.digits << DIGITS_MAP[digit] || '?'
    end
  end

  def to_s
    digits.join
  end

  def to_account
    Account.new(self.digits)
  end
end