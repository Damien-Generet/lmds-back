require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { available_seats: @event.available_seats, category: @event.category, description: @event.description, duration: @event.duration, instrument: @event.instrument, level: @event.level, location: @event.location, max_seats: @event.max_seats, price: @event.price, start_date: @event.start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { available_seats: @event.available_seats, category: @event.category, description: @event.description, duration: @event.duration, instrument: @event.instrument, level: @event.level, location: @event.location, max_seats: @event.max_seats, price: @event.price, start_date: @event.start_date } }, as: :json
    assert_response :success
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event), as: :json
    end

    assert_response :no_content
  end
end
