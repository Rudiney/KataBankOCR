class Account
  attr_accessor :numbers

  def valid?
    valid_checksum?
  end

  def illebile?
    numbers.include?(nil)
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