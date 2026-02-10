require 'rails_helper'
#### test the following ####
# can create user
# user association to stocks :has_many
# user association to orders :has_many
# user role upon creation = false
# verified value upon creation = false
# sends email the moment verified value change true->false & false->true(if possible)

#### if testable ####
# create user password should be the same to confirm_password
# email cannot be used twice
#
#
RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:verified_user) { create(:user, :verified_user) }

  describe "association" do
    it { should have_many(:stocks) }
    it { should have_many(:orders) }
  end

  describe "role" do
    it "should have default value of false" do
      expect(user.role == false).to be true
    end

    it "should have value of true if the user is an admin" do
      expect(admin.role == true).to be true
    end
  end

  describe "status/verified" do
    it "should have default value of false" do
      expect(user.verified == false).to be true
    end

    it "should have verified status true if role is admin" do
      expect(admin.verified == true).to be true
    end
  end
end
