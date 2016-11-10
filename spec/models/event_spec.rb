require 'rails_helper'

RSpec.describe Event, type: :model do

  before :each do
    @user = create(:user)
    @event = create(:event)
  end

  it "validates the presence of name" do
    @event.name = " "
    @event.valid?
    expect(@event.errors[:name]).to include("can't be blank")
  end

  it "validates the presence of description" do
    @event.description = " "
    @event.valid?
    expect(@event.errors[:description]).to include("can't be blank")
  end
  
  it "validates the presence of location" do
    @event.location = " "
    @event.valid?
    expect(@event.errors[:location]).to include("can't be blank")
  end

  it "validates the presence of date" do
    @event.date = " "
    @event.valid?
    expect(@event.errors[:date]).to include("can't be blank")
  end
end
