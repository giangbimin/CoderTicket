class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :set_event, only: [:show]

  def index
    @events = if params[:search].present?
                Event.search(params[:search])
              elsif session[:user_id].present?
                Event.upcoming
              else
                Event.published
              end
  end

  def show; end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
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
