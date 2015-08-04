require 'spec_helper'

RSpec.describe Account do

  it { expect(subject).to respond_to(:numbers) }

  describe '#valid?' do
    it { expect(subject).to respond_to(:valid?) }

    it 'should validate the checksum of the numbers' do
      subject.numbers = [3,4,5,8,8,2,8,6,5]
      expect(subject).to be_valid
    end

    it ' 457508000 is valid' do
      subject.numbers = [4,5,7,5,0,8,0,0,0]
      expect(subject).to be_valid
    end

    it ' 664371495 is not valid' do
      subject.numbers = [6,6,4,3,7,1,4,9,5]
      expect(subject).to_not be_valid
    end
  end

  describe '#illegible' do
    it 'when there is nill numberss, is illegible' do
      subject.numbers = [1,2,3,nil,6,7]
      expect(subject).to be_illegible
    end

    it 'empty is not illegible?' do
      subject.numbers = []
      expect(subject).to_not be_illegible
    end

    it 'filled is not illegible?' do
      subject.numbers = [1,2,3]
      expect(subject).to_not be_illegible
    end

    it 'with 0s is not illegible?' do
      subject.numbers = [0,0,0]
      expect(subject).to_not be_illegible
    end
  end

  describe '#numbers_string' do
    it 'translate nil to ?' do
      subject.numbers = [1,nil,nil,4]
      expect(subject.numbers_string).to eql '1??4'
    end
  end

  describe '#to_s' do
    it 'should join numbers' do
      subject.numbers = [0,0,0,0,0,0,0,0,0]
      expect(subject).to be_valid
      expect(subject).to be_valid
      expect(subject.to_s).to eql '000000000'

      subject.numbers = [1,2,3,4,5,6,7,8,9]
      expect(subject).to be_valid
      expect(subject.to_s).to eql '123456789'
    end

    describe 'when invalid' do
      it 'should add ERR' do
        expect(subject).to receive(:valid?).and_return(false)
        subject.numbers = [1,2,3,4,5,6,7,8,9]
        expect(subject.to_s).to eql '123456789 ERR'
      end
    end

    describe 'when illegible' do
      it 'should add ILL' do
        expect(subject).to receive(:illegible?).and_return(true)
        subject.numbers = [1,2,3,4,5,6,7,8,9]
        expect(subject.to_s).to eql '123456789 ILL'
      end
    end

    describe 'test case' do
      it '457508000 is ok' do
        subject.numbers = [4,5,7,5,0,8,0,0,0]
        expect(subject.to_s).to eql '457508000'
      end

      it '664371495 has ERR' do
        subject.numbers = [6,6,4,3,7,1,4,9,5]
        expect(subject.to_s).to eql '664371495 ERR'
      end

      it '86110??36 is ILL' do
        subject.numbers = [8,6,1,1,0,nil,nil,3,6]
        expect(subject.to_s).to eql '86110??36 ILL'
      end
    end
  end
end