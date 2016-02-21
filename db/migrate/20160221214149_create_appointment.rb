class CreateAppointment < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :description
      t.datetime :appointment_schedule
    end
  end
end
