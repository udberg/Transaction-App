require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  it 'expects name to be at least 3 characters' do
    user.name = 'wi'
    expect(user).to_not be_valid
  end

  it 'expects name to be presente' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'expects the name to have a maximum of 20 characters' do
    user.name = 'widzmarcjeanneslykllmmff'
    expect(user).to_not be_valid
  end
end
