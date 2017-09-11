require 'rails_helper'

RSpec.describe Message, "validations" do
  it { should belong_to :user}
  it { should validate_length_of(:body).is_at_most(150) }
  it { should validate_length_of(:body).is_at_least(1) }
  it { should have_attached_file(:attached_image) }
  it { should validate_attachment_content_type(:attached_image).
       allowing("image/png", "image/gif").
       rejecting("text/plain", "text/xml") }
end

RSpec.describe Message, "#body_for_timeline" do
  it "replaces newline with html line break" do
    body_string = "My messsage should\nbe on two lines"
    message = FactoryGirl.create :message, body: body_string

    message.body_for_timeline.should eq "My messsage should<br />be on two lines"
  end
end
