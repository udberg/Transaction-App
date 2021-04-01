FactoryBot.define do
  factory :transaction do
    author_id { 1 }
    name { 'MyString' }
    amount { 1 }
  end
end
