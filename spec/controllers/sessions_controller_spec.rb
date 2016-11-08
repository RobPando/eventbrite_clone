require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  
  it "logs user is" do
    log_in_user
    expect(session[:user_id]).to_not be_nil
  end

end
