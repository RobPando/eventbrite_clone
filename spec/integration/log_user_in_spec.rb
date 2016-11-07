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
    post login_path, params: { session: { email: @user.email, password: @user.password } }
    expect(response).to redirect_to(@user)
  end

end