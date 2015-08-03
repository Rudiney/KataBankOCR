require 'spec_helper'

RSpec.describe Array do
  it { expect(subject).to respond_to(:in_groups_of) }

  describe '#in_groups_of' do
    subject { [0,1,2,3,4,5,6,7,8,9,0] }

    it 'in_groups_of 1' do
      expect(subject.in_groups_of(1)).to eql [[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0]]
    end

    it 'in_groups_of 2' do
      expect(subject.in_groups_of(2)).to eql [[0,1],[2,3],[4,5],[6,7],[8,9],[0]]
    end

    it 'in_groups_of 3' do
      expect(subject.in_groups_of(3)).to eql [[0,1,2],[3,4,5],[6,7,8],[9,0]]
    end

    it 'in_groups_of 4' do
      expect(subject.in_groups_of(4)).to eql [[0,1,2,3],[4,5,6,7],[8,9,0]]
    end

    it 'in_groups_of 5' do
      expect(subject.in_groups_of(5)).to eql [[0,1,2,3,4],[5,6,7,8,9],[0]]
    end

    it 'in_groups_of 6' do
      expect(subject.in_groups_of(6)).to eql [[0,1,2,3,4,5],[6,7,8,9,0]]
    end

    it 'in_groups_of 7' do
      expect(subject.in_groups_of(7)).to eql [[0,1,2,3,4,5,6],[7,8,9,0]]
    end

    it 'in_groups_of 8' do
      expect(subject.in_groups_of(8)).to eql [[0,1,2,3,4,5,6,7],[8,9,0]]
    end

    it 'in_groups_of 9' do
      expect(subject.in_groups_of(9)).to eql [[0,1,2,3,4,5,6,7,8],[9,0]]
    end

    it 'in_groups_of 10' do
      expect(subject.in_groups_of(10)).to eql [[0,1,2,3,4,5,6,7,8,9],[0]]
    end

    it 'in_groups_of 11' do
      expect(subject.in_groups_of(11)).to eql [[0,1,2,3,4,5,6,7,8,9,0]]
    end
  end
end