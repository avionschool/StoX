require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    @role1 = create(:role)
    @user1 = create(:user, role: @role1)
  end 

  context "Validations" do

    it "1. is valid with valid attributes" do
      expect(@user1).to be_valid
      expect(@user1).to be_truthy
    end

    it "2. is not valid without name" do
      user2 = build(:user, name: nil)
      expect(user2).to_not be_valid
      expect(user2.errors).to be_present
      expect(user2.errors.to_h.keys).to include(:name)
    end

    it "3. is not valid without email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
      expect(user2.errors).to be_present
      expect(user2.errors.to_h.keys).to include(:email)
    end

  end
end
