class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.where("lower(name) LIKE ?", "%#{params[:search].downcase}%").order(created_at: :desc)
    else
      @events = Event.upcoming.order(created_at: :desc)
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
