require "rails_helper"

describe Veterinarian do
  describe "Associations" do
    it { is_expected.to have_one(:address) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:organization_name) }
  end
end
