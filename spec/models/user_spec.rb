require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it "validate presence of name" do
    @user.name = " "
    expect(@user).to_not be_valid
  end

  it "validates presence of email" do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "password can not be less than 6 chars" do
    @user.password = "a" * 5
    @user.password_confirmation = @user.password
    expect(@user).to_not be_valid
  end
end
