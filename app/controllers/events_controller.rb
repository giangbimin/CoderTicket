class EventsController < ApplicationController
  def index
    @events = if params[:search].present?
                Event.search(params[:search])
              else
                Event.upcoming
              end
  end

  def show
    @event = Event.find(params[:id])
  end
end
