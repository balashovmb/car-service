class ServiceCategory < ApplicationRecord
  has_many :service_units, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
