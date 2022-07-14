class ServiceCategory < ApplicationRecord
  has_many :service_units

  validates :name, presence: true, uniqueness: true
end
