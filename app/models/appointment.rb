class Appointment < ActiveRecord::Base
  validates :description, :appointment_schedule, presence: true
end
