FactoryBot.define do
  factory :order do
    sequence(:customer) { |n| "Bill Gates #{n}" }
  end
end
