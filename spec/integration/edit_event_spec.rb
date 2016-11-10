require 'rails_helper'

RSpec.describe "Event Management" do 

  describe "Edit and update" do

    before :each do
      @user = create(:user)
      log_in(@user)
      @event = create(:event)
      get edit_event_path(@event)
    end

    it "goes to edit page" do
      expect(response).to render_template(:edit)
    end

    it "updates event with valid information" do
      put event_path(@event), params: {event: { name: "partyboy", location: "5th dimension" } }
      expect(response).to redirect_to(@event)
      expect(response).to_not render_template(:edit)
    end

    it "renders edit if information is invalid" do
      put event_path(@event), params: {event: { name: " ", location: "5th dimension" } }
      expect(response).to render_template(:edit)
    end

    it "does not let another user edit another event" do
      another_user = create(:user, id: 2)
      another_event = create(:event, creator_id: 2)
      put event_path(another_event), params: {event: { name: "partyboy", location: "5th dimension" } }
      expect(response).to redirect_to(root_url)
    end
  end

  describe "Deleting and event" do
    before :each do
      @user = create(:user)
      @event = create(:event)
    end

    it "deletes and event" do
      delete event_path(@event)
      expect(response).to redirect_to(root_url)
    end
    it "does not let other user delete another event" do
      another_user = create(:user, id: 2)
      another_event = create(:event, creator_id: 2)
      delete event_path(another_event)
      expect(another_user.created_events.first.name).to eq("bday")
      expect(response).to redirect_to(root_url)
    end
  end
end
