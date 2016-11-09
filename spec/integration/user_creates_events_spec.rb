require 'rails_helper'

RSpec.describe "User/Event management", type: :request do
  
  before :each do
    @user = create(:user)
    @another_user = create(:user)
    log_in(@user)
  end

  it "goes to new event page" do
    get new_event_path
    expect(response).to render_template(:new)
  end

  it "creates a new event" do
    post events_path, params: { event: { name: "Some", 
                                         description: "Party",
                                         location: "bumble",
                                         guest: '1'}}
    expect(response).to redirect_to(event_path(1))
  end

  it "submits the wrong info" do
    post events_path, params: { event: { name: " ",
                                         description: "asd",
                                         location: " " } }
    expect(response).to redirect_to(new_event_path)
  end

  it "submits the right information" do
    post events_path, params: { event: { name: "party",
                                         description: "asd",
                                         location: "ma house" } }
    expect(response).to redirect_to(event_path(1))
  end


end

RSpec.feature "Create Event", type: :feature do

  before :each do
    @user = create(:user)
    another_user = create(:user)
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows user to create an event" do
    visit new_event_path
    fill_in "Name", with: "Bday"
    fill_in "Description", with: "ma bday"
    fill_in "Location", with: "ma house"
    click_button "Create Event"

    expect(page).to have_content(@user.name)
    expect(page).to have_content("Bday")
    expect(page).to have_content(@another_user.name)
  end
end