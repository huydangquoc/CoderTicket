class TicketTypesController < ApplicationController
  before_filter :authenticate_user

  def new
    @event = Event.find params[:event_id]
    @ticket_type = @event.ticket_types.new
    session[:return_to] ||= request.referer
  end

  def create
    @event = Event.find params[:event_id]
    @event.ticket_types.create(ticket_type_params)
    if session[:return_to]
      redirect_to session.delete(:return_to)
    else
      redirect_to event_path(@event)
    end
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity)
  end
end
