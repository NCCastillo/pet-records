require "rails_helper"

describe Veterinarian do
  it { is_expected.to have_one(:address) }
  it { is_expected.to accept_nested_attributes_for(:address) }
  it { is_expected.to validate_presence_of(:organization_name) }
end
