class EventRegistrationsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]
  
  # GET /event_registrations
  # GET /event_registrations.json
  def index
    @event_registrations = EventRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_registrations }
    end
  end

  def show
    @event_registration = EventRegistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_registration }
    end
  end


  # GET /event_registrations/new
  # GET /event_registrations/new.json
  def new
    @event_registration = EventRegistration.new
    @event = Event.find(params[:event_id])
    @event_registration.event = @event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_registration }
    end
  end


  # POST /event_registrations
  # POST /event_registrations.json
  def create
    @event_registration = EventRegistration.new(params[:event_registration])
    @event_registration.event_id = params[:event_id]
    respond_to do |format|
      if @event_registration.save
        format.html { redirect_to @event_registration }
        format.json { render json: @event_registration, status: :created, location: @event_registration }
      else
        format.html { render action: "new" }
        format.json { render json: @event_registration.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /event_registrations/1
  # DELETE /event_registrations/1.json
  def destroy
    @event_registration = EventRegistration.find(params[:id])
    @event_registration.destroy

    respond_to do |format|
      format.html { redirect_to event_registrations_url }
      format.json { head :no_content }
    end
  end
end
