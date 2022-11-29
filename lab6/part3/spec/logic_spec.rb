# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Logic do
  include described_class
  describe '#minmax' do
    it 'test on zero response' do
      expect(described_class.minmax([], 1)).to eq([[], []])
    end

    it 'test on normal input' do
      prng1 = Random.new(Random.new_seed)
      data = 10.times.map { prng1.rand(100) }
      expect(described_class.minmax(data, 3)[0].size).to eq(3)
    end
  end
end
