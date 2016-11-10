require 'rails_helper'

RSpec.describe EventsController do

  it "shows all the events" do
    get :index
    expect(response).to have_http_status(:success)
  end

  it "is invalid if name is blank"
  it "is invalid if description is blank"
  it "is invalid if location is blank"
  it "it invalid if date is blank"

  context "date format" do
  end
end
