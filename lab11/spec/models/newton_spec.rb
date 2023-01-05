require 'rails_helper'

RSpec.describe Newton, type: :model do
  describe 'Main cache logic' do
    it 'create model' do
      expect(described_class.new(key: 1.5, data: '{}')).to be_valid
    end

    it 'save model' do
      expect(described_class.new(key: 1.5, data: '{}').save).to be true
    end

    it 'increase model count' do
      expect { described_class.new(key: 1.5, data: '{}').save }.to change(described_class, :count)
    end

    it 'search model' do
      note = described_class.new(key: 1.5, data: '{}')
      note.save
      expect(described_class.where(key: 1.5).first).to eq note
    end

    it 'unique model' do
      described_class.new(key: 1.5, data: '{}').save
      expect { described_class.new(key: 1.5, data: '{}').save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'unique valid model' do
      described_class.new(key: 1.5, data: '{}').save
      expect do
        described_class.new(key: 1.5, data: '{}').save!(validate: false)
      end.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
