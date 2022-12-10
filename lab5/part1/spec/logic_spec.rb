# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Logic do
  include described_class
  describe '#calculate_y' do
    it 'test on zero response' do
      expect(described_class.calculate_y(0, 0, 1)).to be_zero
    end

    it 'test on calc' do
      expect(described_class.calculate_y(0, 0.5, 1)).to eq(1)
    end

    it 'test on crush' do
      expect { described_class.calculate_y(0, 0.5, 0) }.to raise_error(ZeroDivisionError)
    end

    it 'test on exp' do
      expect(described_class.calculate_y(Math::PI * 11, 1, 1)).to be_within(0.0000000001).of(0)
    end
  end
end
