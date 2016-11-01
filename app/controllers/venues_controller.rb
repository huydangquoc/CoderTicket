class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(created_at: :desc)
    @venue = Venue.new
  end

  def create
    @venue = Venue.new venue_params
    if @venue.save
      redirect_to venues_path, flash: {success: "Venue created successfully."}
    else
      redirect_to venues_path, flash: {error: "#{@venue.errors.full_messages.to_sentence}"}
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id)
  end

end
