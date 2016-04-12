require "rails_helper"

describe NewVeterinarianForm do
  context "responds to attr accessor attributes" do
    %w(organization_name vet_name address_1 address_2 city state zip_code).each do |attribute|
      it "returns true for #{attribute.humanize}" do
        new_veterinarian_form = NewVeterinarianForm.new

        expect(new_veterinarian_form.respond_to?(attribute)).to be true
        expect(new_veterinarian_form.respond_to?("#{attribute}=")).to be true
      end
    end
  end

  describe "#persisted?" do
    it "returns false" do
      new_veterinarian_form = NewVeterinarianForm.new

      expect(new_veterinarian_form.persisted?).to be false
    end
  end

  describe "#save" do
    context "when form is valid" do
      it "returns true" do
        new_veterinarian_form = NewVeterinarianForm.new(form_attributes)

        expect(new_veterinarian_form.save).to be true
      end

      it "saves a new veterinarian record" do
        new_veterinarian_form = NewVeterinarianForm.new
        veterinarian = instance_double(Veterinarian, save: true, invalid?: false)
        address = instance_double(Address, save: true, invalid?: false)

        stub_veterinarian_and_address(address, veterinarian)

        new_veterinarian_form.save

        expect(veterinarian).to have_received(:save)
      end

      it "saves a new address record" do
        new_veterinarian_form = NewVeterinarianForm.new
        address = instance_double(Address, save: true, invalid?: false)
        veterinarian = instance_double(Veterinarian, save: true, invalid?: false)

        stub_veterinarian_and_address(address, veterinarian)

        new_veterinarian_form.save

        expect(address).to have_received(:save)
      end
    end

    context "when form is invalid" do
      it "returns false" do
        new_veterinarian_form = NewVeterinarianForm.new

        expect(new_veterinarian_form.save).to be false
      end

      it "promotes errors for veterinarian object", focus: true do
        new_veterinarian_form = NewVeterinarianForm.new

        new_veterinarian_form.save

        expect(new_veterinarian_form.errors.keys).to include(:organization_name)
      end

      it "promotes errors for address object" do
        new_veterinarian_form = NewVeterinarianForm.new

        new_veterinarian_form.save

        expect(new_veterinarian_form.errors.keys).to include(:address_1, :city, :state, :zip_code)
      end
    end
  end

  def stub_veterinarian_and_address(address, veterinarian)
    allow(Veterinarian).to receive(:new).and_return(veterinarian)
    allow(veterinarian).to receive(:build_address).and_return(address)
  end

  def form_attributes
    FactoryGirl.attributes_for(:veterinarian).merge(FactoryGirl.attributes_for(:address))
  end
end
