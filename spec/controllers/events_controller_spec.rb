# Project: RSpec Rails 3.5
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs
# Project: RSpec Expectations 3.5
# https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    @event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
    @event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
    @event3 = FactoryGirl.build(:event, :past_event, name: "Event 3")
    EventHelpers.create_list([@event1, @event2, @event3])
  end

  describe "GET #index" do
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
      get :index

      expect(assigns(:events)).to eq [@event1]
    end
  end

  describe "GET #index search: <search_term>" do
    it "has a search param in url" do
      get :index, params: { search: "Da Lat" }

      expect(controller.params[:search]).not_to be_nil
      expect(controller.params[:search]).to eq "Da Lat"
    end

    it "loads correct event(s) base on search_term" do
      get :index, params: { search: "Event 2" }

      expect(assigns(:events)).to eq [@event2]
    end

    it "search OK in case search_term mismatch case sensitive" do
      get :index, params: { search: "event 2" }

      expect(assigns(:events)).to eq [@event2]
    end

    it "search OK, order desc by created_at" do
      get :index, params: { search: "Event" }

      expect(assigns(:events)).to eq [@event3, @event2, @event1]
    end

    it "returns empty in case no search result" do
      get :index, params: { search: "Quoc Huy" }

      expect(assigns(:events)).to eq []
    end
  end
end
