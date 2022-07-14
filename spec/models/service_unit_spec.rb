require 'rails_helper'

RSpec.describe ServiceUnit, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:service_unit) }
    it { should validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { should belong_to(:service_category) }
  end
end
