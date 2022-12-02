# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Integral do
  include described_class

  describe '#function' do
    it 'test_f' do
      expect(described_class.function(0)).to eq(0)
    end
  end

  describe '#by_iteration' do
    it '10^-5' do
      expect(described_class.by_iteration(1e-5)[0]).to be_within(1e-5).of((1 - Math.cos(1)) / 2)
    end

    it '10^-4' do
      expect(described_class.by_iteration(1e-4)[0]).to be_within(1e-4).of((1 - Math.cos(1)) / 2)
    end
  end
end
