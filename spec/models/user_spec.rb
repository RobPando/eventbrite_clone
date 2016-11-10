require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it "validate presence of name" do
    @user.name = " "
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "validates presence of email" do
    @user.email = " "
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it "password can not be less than 6 chars" do
    @user.password = "a" * 5
    @user.password_confirmation = @user.password
    expect(@user).to_not be_valid
  end

  it "is invalid if the email is not unique" do
    @another_user = User.new(name: "rick", 
                             email: @user.email, 
                             password: "foobar", 
                             password_confirmation: "foobar")
    @another_user.valid?
    expect(@another_user.errors[:email]).to include("has already been taken")
  end
end
