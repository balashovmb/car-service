FactoryBot.define do
  factory :order_position do
    executor
    service_unit
    order
  end
end
