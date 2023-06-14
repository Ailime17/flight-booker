class BookingsController < ApplicationController
  def new
    @flight_id = params["chosen_flight_id"]
    @chosen_flight = Flight.find(@flight_id)
    @num_of_passengers = params["passengers_num"].to_i
  end

  def create
    # p params
    @flight_id = booking_params["chosen_flight_id"]
    @num_of_passengers = booking_params["passengers_num"].to_i

    n=0

    @num_of_passengers.times do
      n+=1
      instance_variable_set("@passenger_#{n}", Passenger.new(booking_params['passengers']["pass_#{n}"]))

      unless instance_variable_get("@passenger_#{n}").save && Booking.create(flight_id: @flight_id, passenger_id: instance_variable_get("@passenger_#{n}").id)
        render :new, status: :unprocessable_entity
        return
      end
    end
    redirect_to root_path
  end

  def booking_params
    params.permit(:authenticity_token, :passengers_num, :chosen_flight_id, :commit, passengers: {})
  end
end
