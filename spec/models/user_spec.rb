require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { User.new }

  context "Validations" do

    it "1. is not valid without name" do
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:name)
    end

    it "2. is not valid without email" do
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email)
    end

    it "3. is not valid without role_id" do
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:role_id)
    end

    it "4. is valid with attributes" do
      user.name = "Sample"
      user.email = "sample@sample.com"
      user.role_id = "4"
      user.save
      expect(user).to be_valid
      expect(user).to be_truthy
    end

  end
end
