# Routing specs: http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/routing-specs
# Config: set `config.infer_spec_type_from_file_location!` in file `rails_helper.rb`
#
# Route_to matcher: http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/routing-specs/route-to-matcher

require 'rails_helper'

RSpec.describe "routes for Events", :type => :routing do
  it "routes `root` go to `events#index`" do
    expect(:get => "/").to route_to(
      :controller => "events",
      :action => "index"
    )
  end

  it "routes `search event` go to `events#index`" do
    expect(:get => "/?search=Da+Lat").to route_to('events#index', search: "Da Lat")
  end

end
