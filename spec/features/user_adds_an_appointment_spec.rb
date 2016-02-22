require "rails_helper"

feature "User adds an appointment" do
  context "with valid attributes" do
    scenario "sees a successful message" do
      sign_in

      add_appointment_and_submit_with(description: "Description")

      expect(page).to have_content "Appointment added."
    end
  end


  context "with an invalid attribute" do
    scenario "sees an unsuccessful message" do
      sign_in

      add_appointment_and_submit_with(description: "")

      expect(page).to have_content "can't be blank"
    end
  end

  def add_appointment_and_submit_with(description:)
    click_on "Add appointment"
    fill_in "Description", with: description
    select "2016", from: "Year"
    select "January", from: "Month"
    select "23", from: "Day"
    select "10", from: "Hour"
    select "30",from: "Minute"
    click_on "Add"
  end
end
