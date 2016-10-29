# Project: RSpec Rails 3.5
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs
# Project: RSpec Expectations 3.5
# https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  before do
    @event = FactoryGirl.build(:event, :upcoming, name: "Event Name")
    EventHelpers.create(@event)
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new, params: {event_id: @event.id}

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new, params: {event_id: @event.id}

      expect(response).to render_template("new")
    end

    it "loads all event into @event" do
      get :new, params: {event_id: @event.id}

      expect(assigns(:event)).to eq @event
    end
  end

  describe "POST #create" do
  end

end
