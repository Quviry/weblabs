# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Window do
  describe '#initialize' do
    it 'child' do
      # expect(described_class.subclasses).to contains('ProtectedWindow')
      expect(ProtectedWindow.superclass).to be(described_class)
    end
  end

  describe '#surface' do
    it 'base' do
      expect { described_class.new(2, 3).surface }.to output(/6\n/).to_stdout
    end

    it 'null' do
      expect { described_class.new(2, 0).surface }.to output(/0\n/).to_stdout
    end
  end
end
