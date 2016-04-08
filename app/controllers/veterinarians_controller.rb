class VeterinariansController < ApplicationController
  def new
    @veterinarian = Veterinarian.new
    @veterinarian.build_address

  end
  end
end
