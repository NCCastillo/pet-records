require "rails_helper"

feature "User views an empty dashboard" do
  scenario "sees an add link" do
    sign_in

    expect(page).to have_link("Add pet")
  end

  scenario "sees an add appointment link" do
    sign_in

    expect(page).to have_link("Add appointment")
  end

  scenario "sees an add reminder link" do
    sign_in

    expect(page).to have_link("Add reminder")
  end

  scenario "sees an add veterinary link" do
    sign_in

    expect(page).to have_link("Add veterinary info")
  end
end
