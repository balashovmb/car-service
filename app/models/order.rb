class Order < ApplicationRecord
  validates :customer, presence: true
end
