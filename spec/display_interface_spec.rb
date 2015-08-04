require 'spec_helper'

RSpec.describe DisplayInterface do

  it { expect(subject).to respond_to(:screen) }
  it { expect(subject).to respond_to(:digits) }

  describe '#to_account' do
    it 'should create an account with my digits' do
      subject.digits = [1,2,3,4]
      acc = subject.to_account

      expect(acc).to be_an Account
      expect(acc.numbers).to eql subject.digits
    end
  end

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

    it 'Use Case 1' do
      file = File.read(File.expand_path('../data/use_case_1.txt',__FILE__))
      list = DisplayInterface.parse_file(file)

      expect(list.size).to eql 11
      expect(list[0].to_s).to eql "000000000"
      expect(list[1].to_s).to eql "111111111"
      expect(list[2].to_s).to eql "222222222"
      expect(list[3].to_s).to eql "333333333"
      expect(list[4].to_s).to eql "444444444"
      expect(list[5].to_s).to eql "555555555"
      expect(list[6].to_s).to eql "666666666"
      expect(list[7].to_s).to eql "777777777"
      expect(list[8].to_s).to eql "888888888"
      expect(list[9].to_s).to eql "999999999"
      expect(list[10].to_s).to eql "123456789"
    end

    it 'use case 3' do
      file = File.read(File.expand_path('../data/use_case_3.txt',__FILE__))
      list = DisplayInterface.parse_file(file)
      list.map!{ |d| d.to_account }
      
      expect(list.size).to eql 3
      expect(list[0].to_s).to eql "000000051"
      expect(list[1].to_s).to eql "49006771? ILL"
      expect(list[2].to_s).to eql "1234?678? ILL"
    end
  end
end