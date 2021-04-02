require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'associations' do
    it { should have_many(:groups) }
    it { should have_many(:payments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
