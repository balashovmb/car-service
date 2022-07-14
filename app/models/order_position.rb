class OrderPosition < ApplicationRecord
  belongs_to :executor
  belongs_to :service_unit
  belongs_to :order
end
