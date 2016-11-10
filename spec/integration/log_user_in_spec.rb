require 'rails_helper'

RSpec.describe "Log user in" do

  before :each do
    @user = create(:user)
    log_in(@user)
  end

  it "renders login page if wrong informations" do
    post login_path, params: { session: { email: " ", password: " " } }
    expect(response).to render_template(:new)
  end

  it "log user in" do
    expect(response).to redirect_to(@user)
  end

  it "logs user out" do
    delete logout_path
    expect(response).to redirect_to(root_url)
  end
end