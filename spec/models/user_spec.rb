require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:travels) }
    it { should have_many(:groups) }
    it { should have_one_attached(:profile_pic) }
  end

  describe 'validations for name' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(40) }
  end

  describe 'validations for employee_id' do
    it { should validate_presence_of(:employee_id) }
    it { should validate_length_of(:employee_id).is_equal_to(5) }
  end
end
