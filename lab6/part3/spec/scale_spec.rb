# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Scale do
  include described_class
  describe '#deff' do
    it 'base' do
      expect(described_class.deff(10)).to eq(10)
    end
  end

  describe '#scale' do
    it 'block' do
      expect(described_class.scale(10) { |x| x }).to eq(10)
    end

    it 'lambda' do
      expect(described_class.scale(10, proc { |x| x })).to eq(10)
    end

    it 'default' do
      expect(described_class.scale(10)).to eq(10)
    end
  end
end
