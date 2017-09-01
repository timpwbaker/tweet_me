require "rails_helper"

RSpec.feature "user visits index page", :type => :feature do
  context "creating messages" do 
    it "can create a message" do
      visit root_path
      fill_in "New message", with: "Rails magic"
      click_button "Send"

      expect(page).to have_content "Rails magic"
    end
  end
  context "reading messages" do
    it "can see recent messages" do
      message = FactoryGirl.create(:message)

      visit root_path
      expect(page).to have_content message.body
    end
  end
end
