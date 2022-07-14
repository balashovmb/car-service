class Order < ApplicationRecord
  has_many :order_positions, dependent: :destroy
  has_many :executors, through: :order_positions

  validates :customer, presence: true
end
