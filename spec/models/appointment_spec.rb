require "rails_helper"

describe Appointment do
 it { is_expected.to validate_presence_of(:description) }
 it { is_expected.to validate_presence_of(:appointment_schedule) }
end
