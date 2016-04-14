require "rails_helper"

describe Pet do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:pet_name)}
    it { is_expected.to validate_presence_of(:owner)}
  end
end
