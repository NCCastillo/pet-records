require "rails_helper"

describe Pet do
  it { is_expected.to validate_presence_of(:pet_name)}
  it { is_expected.to validate_presence_of(:owner)}
end
