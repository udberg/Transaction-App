require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#Transaction' do
    let(:transaction) { FactoryBot.build(:transaction) }
    it 'expects the name to be present' do
      transaction.name = nil
      expect(transaction).to_not be_valid
    end

    it 'expects the amount of money to be present' do
      transaction.amount = nil
      expect(transaction).to_not be_valid
    end
  end
end
