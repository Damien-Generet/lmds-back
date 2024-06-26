class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]
  before_action :authenticate_user!

  
  # curl -XPOST -i "Authorization: [Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0NCIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTcxNzUxOTU0MiwiZXhwIjoxNzE3NTIzMTQyLCJqdGkiOiI3MWNlZGNmNC0xMGRkLTRmMmItOTJmZS1jNWFjM2Q5MDZlNDQifQ.UOVW6bQJmlJJLdfLpGlGotpULIGKgQr9yess1M7xBt8]" -H "Content-Type: application/json" -d '{ "event": {"creator_id": "23", "category": "stage", "price": "99", "max_seats": "99" } }' http://localhost:3000/events

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      puts(current_user)
      params.require(:event).permit(:category, :instrument, :level, :price, :start_date, :duration, :description, :location, :available_seats, :max_seats)
    end
end
