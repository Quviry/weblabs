require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'CRUD' do
    it 'create' do
      expect { described_class.new(login: 'login', password: 'password').save }.to change(described_class, :count)
    end

    it 'read' do
      user = described_class.new(login: 'login', password: 'password')
      user.save!
      expect(described_class.where(login: 'login').first).to eq user
    end

    it 'update' do
      user = described_class.new(login: 'login', password: 'password')
      user.save!
      expect do
        described_class.where(login: 'login').first.update(login: 'another')
      end.to change { described_class.find(user.id).login }.to('another')
    end

    it 'delete' do
      user = described_class.new(login: 'login', password: 'password')
      user.save
      expect { user.destroy }.to change(described_class, :count).by(-1)
    end
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
