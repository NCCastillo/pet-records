class VeterinariansController < ApplicationController
  def new
    @veterinarian_form = NewVeterinarianForm.new
  end

  def create
    @veterinarian_form = NewVeterinarianForm.new(new_veterinarian_form_params)

    if @veterinarian_form.save
      redirect_to root_path, notice: "Veterinarian info added"
    else
      render :new
    end
  end

  private

  def new_veterinarian_form_params
    params.require(:new_veterinarian_form).permit(
      :organization_name,
      :vet_name,
      :address_1,
      :address_2,
      :city,
      :state,
      :zip_code)
  end
end
