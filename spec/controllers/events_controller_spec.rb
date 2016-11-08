require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  it "shows all the events" do
    get :index
    expect(response).to have_http_status(:success)
  end

end
