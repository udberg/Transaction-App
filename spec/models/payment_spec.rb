require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject(:payment) { build(:payment) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:payments_groups) }
    it { should have_many(:groups).through(:payments_groups) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).with_message('Transaction name should be at lest 4 letters.') }

    it { should validate_presence_of(:amount) }
  end
end
