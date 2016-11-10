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

  describe "#past_events" do
    context "shows past events" do
      before :each do
        @user = create(:user)
        @another_user = create(:user)
        @event = create(:event)
        @event.invitations.create(user_id: @another_user.id)
        @another_event = create(:event, date: 3.days.from_now, creator_id: @user.id)
        @another_event.invitations.create(user_id: @another_user.id)
      end

      it "fetches past events" do
        expect(@another_user.events.past_events).to include(@event)
      end

      it "does not fetch upcoming events" do
        expect(@another_user.events.past_events).to_not include(@another_user)
      end
    end
  end

  describe "#upcoming_events" do
    context "show upcoming events" do
      before :each do
        @user = create(:user)
        @another_user = create(:user)
        @event = create(:event, date: 3.days.from_now)
        @event.invitations.create(user_id: @another_user.id)
      end

      it "fetches the upcoming events" do
        expect(@another_user.events.upcoming_events).to include(@event)
      end
    end
  end
end
