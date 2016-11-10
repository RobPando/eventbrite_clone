require 'rails_helper'

RSpec.describe EventsController do

  it "shows all the events" do
    get :index
    expect(response).to have_http_status(:success)
  end

  context "Edit and updating" do
    it "goes to edit page"
    it "updates event with valid information"
    it "renders edit if information is invalid"
    it "does not let another user edit another event"
  end

  context "Deleting event" do
    it "deletes and event"
    it "does not let other user delete another event"
  end
end
