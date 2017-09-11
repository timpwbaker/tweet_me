require "rails_helper"

RSpec.feature "user signs in" do
  it "successfully signs in" do
    user = FactoryGirl.create :user

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_content "Signed in"
    expect(page).to have_content "Sign out"
  end
end
