class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to root_path, notice: "Appointment added."
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description,
      :"appointment_schedule(1i)",
      :"appointment_schedule(2i)",
      :"appointment_schedule(3i)",
      :"appointment_schedule(4i)",
      :"appointment_schedule(5i)"
    )
  end
end
