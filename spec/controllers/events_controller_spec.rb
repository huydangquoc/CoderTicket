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

  describe "GET #index search: <search_term>" do

    before do
      # init category object
      @category = FactoryGirl.create(:category)
    end

    it "has a search param in url" do
      get :index, params: { search: "Da Lat" }

      expect(controller.params[:search]).not_to be_nil
      expect(controller.params[:search]).to eq "Da Lat"
    end

    it "loads correct event(s) base on search_term" do
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Event 2", "past_event", @category)
      event3 = EventHelpers.event_creator("Event 3", "past_event", @category)
      get :index, params: { search: "Event 2" }

      expect(assigns(:events)).to eq [event2]
    end

    it "search OK in case search_term mismatch case sensitive" do
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Event 2", "past_event", @category)
      event3 = EventHelpers.event_creator("Event 3", "past_event", @category)
      get :index, params: { search: "event 2" }

      expect(assigns(:events)).to eq [event2]
    end

    it "search OK, order desc by created_at" do
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Su Kien", "past_event", @category)
      event3 = EventHelpers.event_creator("Event 3", "past_event", @category)
      get :index, params: { search: "Event" }

      expect(assigns(:events)).to eq [event3, event1]
    end

    it "returns empty in case no search result" do
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Event 2", "past_event", @category)
      event3 = EventHelpers.event_creator("Event 3", "past_event", @category)
      get :index, params: { search: "Quoc Huy" }

      expect(assigns(:events)).to eq []
    end

  end
end
