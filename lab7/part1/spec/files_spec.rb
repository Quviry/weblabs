# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Files do
  include described_class
  describe '#post_a' do
    def test_file(inp)
      File.write('./smth.txt', inp)
      described_class.post_a('./smth.txt', './smth.out.txt')
      yield
      File.delete('./smth.txt')
      File.delete('./smth.out.txt')
    end

    it 'test on empty' do
      test_file('') { expect(File.read('./smth.out.txt')).to eq('') }
    end

    it 'test on value' do
      test_file('ab') { expect(File.read('./smth.out.txt')).to eq('b') }
    end

    it 'test on random' do
      inp = (0...50).map { ('b'..'z').to_a[rand(25)] }.join
      test_file(inp) { expect(File.read('./smth.out.txt')).to eq('') }
    end

    it 'test on random full' do
      inp_raw = (0...50).map { ('b'..'z').to_a[rand(25)] }.join
      inp = inp_raw.chars.map { |c| "a#{c}" }.join
      test_file(inp) { expect(File.read('./smth.out.txt')).to eq(inp_raw) }
    end
  end
end
