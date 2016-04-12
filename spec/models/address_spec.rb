require "rails_helper"

describe Address do
  describe "Associations" do
    it { is_expected.to belong_to(:addressable) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:address_1) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip_code) }
  end
end
