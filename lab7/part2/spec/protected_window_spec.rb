# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe ProtectedWindow do
  describe '#initialize' do
    it 'rel' do
      expect(described_class).to be < Window
    end
  end

  describe '#surface' do
    it 'base' do
      expect { described_class.new(2, 3, true).surface }.to output(/6\n/).to_stdout
    end

    it 'null' do
      expect { described_class.new(2, 0, true).surface }.to output(/0\n/).to_stdout
    end
  end

  describe '#protected' do
    it 't' do
      expect { described_class.new(2, 3, true).protected? }.to output(/true\n/).to_stdout
    end

    it 'f' do
      expect { described_class.new(2, 0, false).protected? }.to output(/false\n/).to_stdout
    end
  end
end
