require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:travel_groups) }
    it { should have_many(:travels).through(:travel_groups) }
    it { should have_one_attached(:icon) }
  end

  describe 'validations for name' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }
    it { should validate_length_of(:name).is_at_most(40) }
  end
end
