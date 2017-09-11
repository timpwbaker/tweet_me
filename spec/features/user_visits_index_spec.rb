require "rails_helper"

RSpec.feature "User manages messages" do
  context "reading messages" do
    it "can see recent messages at index" do
      message = FactoryGirl.create(:message)

      visit root_path
      expect(page).to have_content message.body
    end
  end

  context "deleting messages" do
    it "can delete messages from index" do
      message = FactoryGirl.create(:message)

      visit root_path
      click_link "delete-message-#{message.id}"
      expect(page).to have_content "Successfully deleted your message"
    end
  end
end
