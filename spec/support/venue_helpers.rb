module VenueHelpers

  def self.get_or_create(venue_name = "Venue Name")
    venue = Venue.find_by name: venue_name
    if !venue
      venue = Venue.create(name: venue_name)
    end
    return venue
  end

end

RSpec.configure do |config|
  config.include VenueHelpers
end
