class TicketTypesController < ApplicationController
  before_filter :authenticate_user

  def create
    @event = Event.find params[:event_id]
    @event.ticket_types.create(ticket_type_params)
    redirect_to event_path(@event)
  end

  private

  def ticket_type_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity)
  end
end
