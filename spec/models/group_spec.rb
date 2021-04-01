require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.build(:group) }
  it 'expect the name to be present' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'expect the name to be at least 3 characters' do
    group.name = 'ma'
    expect(group).to_not be_valid
  end

  it 'expect the icon to be present' do
    group.icon = nil
    expect(group).to_not be_valid
  end

  it 'expect the name to have a maximum of 20 characters' do
    group.name = 'widzmarcjeanneslywidzjeanmarcneslywidzjean'
    expect(group).to_not be_valid
  end
end
