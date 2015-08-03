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

      expect(parsed.digits).to eql [1,2,3,4,5,6,7,8,9]
    end
  end

  describe '.parse_file' do
    let(:file) { File.read(File.expand_path('../data/input_examples.txt',__FILE__)) }

    it 'should parse from file' do
      output = DisplayInterface.parse_file(file)

      expect(output).to include("000000000")
      expect(output).to include("111111111")
      expect(output).to include("222222222")
      expect(output).to include("333333333")
      expect(output).to include("444444444")
      expect(output).to include("555555555")
      expect(output).to include("666666666")
      expect(output).to include("777777777")
      expect(output).to include("888888888")
      expect(output).to include("999999999")
      expect(output).to include("123456789")
      expect(output).to include("000000051")

    end
  end
end