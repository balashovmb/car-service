FactoryBot.define do
  factory :service_unit do
    service_category
    sequence(:name) { |n| "Покраска бампера #{n}" }
  end
end
