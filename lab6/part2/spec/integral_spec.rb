# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Integral do
  include described_class
  describe '#by_iteration' do
    it '10^-5' do
      expect(described_class.by_each(1e-5)[0]).to be_within(1e-5).of((1 - Math.cos(1)) / 2)
    end

    it '10^-4' do
      expect(described_class.by_each(1e-4)[0]).to be_within(1e-4).of((1 - Math.cos(1)) / 2)
    end
  end
end
