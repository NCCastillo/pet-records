require "rails_helper"

describe User, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:pets) }
  end
end
