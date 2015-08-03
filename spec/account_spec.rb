require 'spec_helper'

RSpec.describe Account do

  it { expect(subject).to respond_to(:number) }

  describe '#valid?' do
    it { expect(subject).to respond_to(:valid?) }

    it 'should validate the checksum of the number' do
      subject.number = 345882865
      expect(subject).to be_valid
    end

    it ' 457508000 is valid' do
      subject.number = 457508000
      expect(subject).to be_valid
    end

    it ' 664371495 is not valid' do
      subject.number = 664371495
      expect(subject).to_not be_valid
    end
  end
end