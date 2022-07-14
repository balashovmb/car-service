class ServiceUnit < ApplicationRecord
  belongs_to :service_category

  validates :name, presence: true, uniqueness: true
end
