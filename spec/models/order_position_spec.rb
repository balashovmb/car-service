require 'rails_helper'

RSpec.describe OrderPosition, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:order_position) }
    it { should belong_to(:service_unit) }
    it { should belong_to(:executor) }
    it { should belong_to(:order) }
  end
end
