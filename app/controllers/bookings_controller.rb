class BookingsController < ApplicationController
  def new
    @flight_id = params["chosen_flight_id"]
    @chosen_flight = Flight.find(@flight_id)
    @num_of_passengers = params["passengers_num"].to_i

    @booking = Booking.new(flight_id: @flight_id)
    @num_of_passengers.times do
      @booking.passengers.build
    end
  end

  def create
    
  end
end
