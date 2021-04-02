FactoryBot.define do
  factory :user do
    name { 'John' }
    sequence(:email) { |n| "john@ex#{n}.com" }
    password { 'password' }
  end
end
