require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "test@example.com" ) }

  describe "attributes" do 
    it "should have an email attribute" do
      expect(user).to have_attributes(email: user.email)
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_email) { User.create! }

    it "should be an invalid due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
end