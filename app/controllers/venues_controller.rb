class VenuesController < ApplicationController
  before_action :authorize
  before_action :set_venue, only: [:show]

  def show; end

  def new
    @event = current_user.venues.build
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id)
  end
end
