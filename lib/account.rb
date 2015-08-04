class Account
  attr_accessor :numbers

  def initialize(numbers=nil)
    self.numbers = numbers
  end

  def valid?
    valid_checksum?
  end

  def illegible?
    numbers.include?(nil)
  end

  def to_s
    return numbers_string + ' ILL' if illegible?
    return numbers_string + ' ERR' if !valid?
    numbers_string
  end

  def numbers_string
    numbers.map { |n| n.nil? ? '?' : n.to_s }.join
  end

  private

  def valid_checksum?
    reverse_numbers = numbers.reverse
    checksum = 0

    reverse_numbers.each_with_index do |digit, index|
      checksum += (index+1)*digit.to_i
    end

    return (checksum % 11) == 0
  end
end