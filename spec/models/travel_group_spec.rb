require 'rails_helper'

RSpec.describe TravelGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:travel) }
    it { should belong_to(:group) }
  end
end
