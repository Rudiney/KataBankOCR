require 'spec_helper'

RSpec.describe DisplayInterface do

  it { expect(subject).to respond_to(:screen) }
  it { expect(subject).to respond_to(:digits) }

  describe '.from_screen' do
    it { expect(DisplayInterface).to respond_to(:from_screen) }

    it 'should parse screen to digits' do
      screen = "    _  _     _  _  _  _  _ \n"+
               "  | _| _||_||_ |_   ||_||_|\n"+
               "  ||_  _|  | _||_|  ||_| _|\n"+
               "                           \n"
      parsed = DisplayInterface.from_screen(screen)

      expect(parsed.digits).to eql 123456789
    end
  end

end