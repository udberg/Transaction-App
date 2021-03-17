require 'rails_helper'

RSpec.describe Group, type: :model do
  subject(:group) { build(:group) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:payments_groups) }
    it { should have_many(:payments).through(:payments_groups) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end
