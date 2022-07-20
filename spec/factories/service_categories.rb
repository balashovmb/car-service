FactoryBot.define do
  factory :service_category do
    sequence(:name) { |n| "Покраска #{n}" }
  end
end
