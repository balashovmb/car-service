class Order < ApplicationRecord
  has_many :order_positions, dependent: :destroy

  validates :customer, presence: true
end
