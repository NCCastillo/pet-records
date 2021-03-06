require "rails_helper"

feature "User adds a pet" do
  context "with valid attributes" do
    scenario "sees a successful message" do
      pet_name = "Lilo Castillo"
      pet_breed = "Mix"
      pet_owner = "Alex Collado"
      pet_age = 10

      sign_in

      click_on "Add pet"
      fill_in "Pet name", with: pet_name
      fill_in "Owner", with: pet_owner
      fill_in "Breed", with: pet_breed
      fill_in "Age", with: pet_age
      click_on "Add"

      expect(page).to have_content "#{pet_name} added."
    end
  end

  context "with invalid attributes" do
    scenario "sees an unsuccessful message" do
      sign_in

      click_on "Add pet"
      click_on "Add"

      expect(page).to have_content "can't be blank"
    end
  end
end
