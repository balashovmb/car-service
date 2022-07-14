class Executor < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
