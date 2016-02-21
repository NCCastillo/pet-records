class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to root_path, notice: "#{@pet.pet_name} added."
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:pet_name)
  end
end
