require "rails_helper"

RSpec.feature "user visits index page", :type => :feature do
  context "creating a message" do
    it "sucessfully creates a message" do
      visit root_path
      fill_in "New message", with: "Rails magic"
      click_button "Send"

      expect(page).to have_content "Rails magic"
      expect(page).to have_content "Successfully sent message, why not send another?"
    end
    it "fails validation and is given errors" do
      visit root_path
      click_button "Send"

      expect(page).to have_content "Body is too short (minimum is 1 character)"

      fill_in "New message", with: "Definitely more than 150 characters At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corr"
      click_button "Send"

      expect(page).to have_content "Body is too long (maximum is 150 characters)"
    end
  end

  context "reading messages" do
    it "can see recent messages" do
      message = FactoryGirl.create(:message)

      visit root_path
      expect(page).to have_content message.body
    end
  end

  context "deleting messages" do
    it "can delete messages" do
      FactoryGirl.create(:message)

      visit root_path
      click_link "Delete"
      expect(page).to have_content "Successfully deleted your message"
    end
  end
end
