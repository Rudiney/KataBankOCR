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
      expect(subject).to be_illebile
    end

    it 'empty is not illebile?' do
      subject.numbers = []
      expect(subject).to_not be_illebile
    end

    it 'filled is not illebile?' do
      subject.numbers = [1,2,3]
      expect(subject).to_not be_illebile
    end
  end
end