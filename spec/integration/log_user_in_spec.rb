require 'rails_helper'

RSpec.describe "Log user in", type: :request do

  before :each do
    @user = create(:user)
  end

  it "renders login page if wrong informations" do
    post login_path, params: { session: { email: " ", password: " " } }
    expect(response).to render_template(:new)
  end

  it "logged user in" do
    logged_in(@user)
    expect(response).to redirect_to(@user)
    expect(session['user_id']).to_not be_nil
  end

  it "logs user out" do
    delete logout_path
    expect(response).to redirect_to(root_url)
    expect(session['user_id']).to be_nil
  end

end