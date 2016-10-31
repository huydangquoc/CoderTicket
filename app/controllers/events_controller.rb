class EventsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create, :published, :unpublished, :publish]

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

  def published
    @events = Event.published(current_user.id).order(created_at: :desc)
  end

  def unpublished
    @events = Event.unpublished(current_user.id).order(created_at: :desc)
  end

  def publish
    @event = Event.find(params[:id])
    if @event.user.id == current_user.id
      @event.published_at = Time.now
      @event.save!
      redirect_to unpublished_events_path, flash: {success: "Event is published successfully."}
    else
      redirect_to unpublished_events_path, flash: {error: "You're not owner of this event."}
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    starts_at = DateTime.civil(params[:starts_at][:year].to_i,
                               params[:starts_at][:month].to_i,
                               params[:starts_at][:day].to_i,
                               params[:starts_at][:hours].to_i,
                               params[:starts_at][:minutes].to_i)
    ends_at = DateTime.civil(params[:ends_at][:year].to_i,
                             params[:ends_at][:month].to_i,
                             params[:ends_at][:day].to_i,
                             params[:ends_at][:hours].to_i,
                             params[:ends_at][:minutes].to_i)
    @event.starts_at = starts_at
    @event.ends_at = ends_at
    if @event.save
      redirect_to root_path, flash: {success: "Event created successfully."}
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :category_id, :starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description)
  end

end
