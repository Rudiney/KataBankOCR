class Account
  attr_accessor :number

  def valid?
    valid_checksum?
  end

  private

  def valid_checksum?
    reverse_digits = number.to_s.split('').reverse
    checksum = 0

    reverse_digits.each_with_index do |digit, index|
      checksum += (index+1)*digit.to_i
    end

    return (checksum % 11) == 0
  end
end