class NewVeterinarianForm
  include ActiveModel::Model

 attr_accessor :organization_name,
  :vet_name,
  :address_1,
  :address_2,
  :city,
  :state,
  :zip_code

  validate :validate_objects

  def persisted?
    false
  end

  def save
    success = false

    if valid?
      ActiveRecord::Base.transaction do
        success = true if veterinarian.save && address.save

        fail ActiveRecord::Rollback if !success
      end
    end
    success
  end

  private

  def veterinarian
    @veterinarian ||= Veterinarian.new(organization_name: organization_name,
      vet_name: vet_name)
  end

  def address
    @address ||= veterinarian.build_address(address_1: address_1,
      address_2: address_2,
      city: city,
      state: state,
      zip_code: zip_code)
  end

  def validate_objects
    if veterinarian.invalid?
       promote_errors(veterinarian)
    end

    if address.invalid?
       promote_errors(address)
    end
  end

  def promote_errors(child)
    child.errors.each do |attribute, message|
      errors.add(attribute, message)
    end
  end
end
