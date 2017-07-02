class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create]

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

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue,
                                  :category, :extended_html_description,
                                  :hero_image_url)
  end
end
