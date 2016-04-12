class VeterinariansController < ApplicationController
  def new
    @veterinarian = Veterinarian.new
    @address = @veterinarian.build_address
  end

  def create
    @veterinarian = Veterinarian.new(vet_params)

    if @veterinarian.save
      redirect_to root_path, notice: "Veterinarian info added"
    else
      render :new
    end
  end

  private

  def vet_params
    params.require(:veterinarian).permit(:organization_name)
  end
end
