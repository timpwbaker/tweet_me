require 'rails_helper'

RSpec.describe User, "validations" do
  it { should have_many :messages}
  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}
  it { should validate_presence_of :email}
  it { should validate_uniqueness_of :email}
end

RSpec.describe User, ".guest" do
  it "should find an existing guest user" do
    user = FactoryGirl.create :user, :guest

    expect(User.guest).to eq user
  end

  it "should create a guest user if there isn't one" do
    expect(User.guest.name).to eq "Anonymous"
  end
end
