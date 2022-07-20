FactoryBot.define do
  factory :executor do
    sequence(:name) { |n| "Иван Иванов #{n}" }
  end
end
