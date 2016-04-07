require "rails_helper"

describe Veterinarian do
  it { is_expected.to have_one(:address) }
end
