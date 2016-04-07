require "rails_helper"

feature "User adds veterinary info" do
  context "with valid attributes" do
    scenario "sees a successful message" do
      sign_in

      click_on "Add veterinary info"
      fill_in "Organization name", with: "Alex Vet Hospital"
      fill_in "Vet name", with: "Alex Collado"
      fill_in "Address 1", with: "123 Doggy Lane"
      fill_in "Address 2", with: "Unit 1"
      fill_in "City" , with: "Boulder"
      select "Colorado", from: "State"
      fill_in "Zip code", with: "80301"

      expect(page).to have_content "Veterinary info added"
    end
  end
end