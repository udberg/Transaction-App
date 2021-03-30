require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:travel_groups) }
    it { should have_many(:groups).through(:travel_groups) }
  end

  describe 'validations for purpose' do
    it { should validate_presence_of(:purpose) }
    it { should validate_length_of(:purpose).is_at_least(4) }
    it { should validate_length_of(:purpose).is_at_most(40) }
  end

  describe 'validations for source' do
    it { should validate_presence_of(:source) }
    it { should validate_length_of(:source).is_at_least(2) }
    it { should validate_length_of(:source).is_at_most(20) }
  end

  describe 'validations for destination' do
    it { should validate_presence_of(:destination) }
    it { should validate_length_of(:destination).is_at_least(2) }
    it { should validate_length_of(:destination).is_at_most(20) }
  end

  describe 'validations for distance' do
    it { should validate_presence_of(:distance) }
  end
end
