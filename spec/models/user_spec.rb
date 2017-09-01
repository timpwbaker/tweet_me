require 'rails_helper'

RSpec.describe User, "validations" do
  it { should have_many :messages}
  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}
end
