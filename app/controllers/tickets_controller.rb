class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])

    order = Hash.new
    is_empty_order = true
    is_over_quantity = false
    is_over_10 = false

    @event.ticket_types.each do |type|
      order[type.id] = params["quantity_#{type.id}"].to_i
      if order[type.id] > 10
        is_over_10 = true
        break
      elsif order[type.id] > type.max_quantity
        is_over_quantity = true
        break
      elsif is_empty_order && order[type.id] > 0
        is_empty_order = false
      end
    end

    if is_over_10
      flash[:error] = "You can't buy more than 10 tickets of one type."
    elsif is_over_quantity
      flash[:error] = "You can't buy more than number of available tickets."
    elsif is_empty_order
      flash[:error] = "Seriously? You choose to buy nothing."
    else
      flash[:success] = "Your order is created successfully."
    end
    # render 'new'
    redirect_to new_event_ticket_path
  end
end
