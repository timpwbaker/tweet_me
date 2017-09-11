require "rails_helper"

RSpec.feature "User registers an account" do
  it "successfully registers an account" do
    visit root_path
    click_link "Sign up"
    fill_in "Name", with: "abc"
    fill_in "Email", with: "abc@onetwothree.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Thank you for registering"
  end
end
