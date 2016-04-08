class VeterinariansController < ApplicationController
  def new
    @veterinarian = Veterinarian.new
    @veterinarian.build_address

  end

  def create
    redirect_to root_path
  end
end
