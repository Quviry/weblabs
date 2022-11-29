# logic_spec.rb
# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Logic do
  include described_class
  describe '#count_students' do
    it 'test on zero response' do
      expect(described_class.count_students([])).to be_empty
    end

    it 'test lass' do
      expect(described_class.count_students(['group1 Heyeyye']).size).to eq(1)
    end

    it 'test lass2' do
      expect(described_class.count_students(['group1 Heyeyye'])['group1']).to eq(1)
    end
  end
end
