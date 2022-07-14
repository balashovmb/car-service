require 'rails_helper'

RSpec.describe Executor, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:executor) }
    it { should validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
