require "rails_helper"

RSpec.feature "User sends a message" do
  context "creating a message" do
    it "fails validation and is given errors" do
      visit root_path
      click_button "Send"

      expect(page).to have_content "This message couldn't be created because the body is too short"

      fill_in "message_body", with: "Definitely more than 150 characters At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corr"
      click_button "Send"

      expect(page).to have_content "This message couldn't be created because the body is too long"
    end

    it "sucessfully creates a message as a guest" do
      visit root_path
      fill_in "message_body", with: "Rails magic"
      attach_file "message_attached_image", Rails.root + 'spec/test-files/test.png'
      click_button "Send"

      expect(page).to have_content "Rails magic"
      expect(page).to have_content "@Anonymous"
      expect(page).to have_xpath("//img[contains(@src,'test.png')]")
      expect(page).to have_content "Successfully sent message, why not send another?"
    end

    it "sucessfully creates a message as a logged in user" do
      user = FactoryGirl.create :user, name: "Tweetbot"

      visit root_path
      click_link "Sign in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      fill_in "message_body", with: "Public message"
      click_button "Send"

      expect(page).to have_content "Public message"
      expect(page).to have_content "@Tweetbot"
      expect(page).to have_content "Successfully sent message, why not send another?"
    end
  end
end
