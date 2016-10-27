require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do

    before do
      # init category object
      @category = FactoryGirl.create(:category)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "loads all upcoming events into @events" do
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Event 2", "past_event", @category)
      event3 = EventHelpers.event_creator("Event 3", "past_event", @category)
      get :index

      expect(assigns(:events)).to eq [event1]
    end

  end
end
