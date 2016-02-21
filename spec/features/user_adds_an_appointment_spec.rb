require "rails_helper"

feature "User adds an appointment" do
  scenario "sees a successful message" do
    sign_in

    click_on "Add appointment"
    fill_in "Description", with: "Description"
    select "2016", from: "Year"
    select "January", from: "Month"
    select "23", from: "Day"
    select "10", from: "Hour"
    select "30",from: "Minute"
    click_on "Add"

    expect(page).to have_content "Appointment added."
  end
end
