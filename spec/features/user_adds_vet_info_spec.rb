require "rails_helper"

feature "User adds veterinary info" do
  context "when the form is valid" do
    scenario "they see a successful message" do
      sign_in

      click_on "Add veterinary info"
      fill_in "Organization name", with: "Alex Vet Hospital"
      fill_in "Vet name", with: "Alex Collado"
      fill_in "Address 1", with: "123 Doggy Lane"
      fill_in "Address 2", with: "Unit 1"
      fill_in "City" , with: "Boulder"
      fill_in "State", with: "CO"
      fill_in "Zip code", with: "80301"
      click_on "Add"

      expect(page).to have_content "Veterinarian info added"
    end
  end

  context "when the form is invalid" do
    scenario "the see an error message" do
      sign_in

      click_on "Add veterinary info"
      click_on "Add"

      expect(page).to have_content "can't be blank"
    end
  end

end
