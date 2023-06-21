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
    @flight_id = params['flight_id']

    @booking = Booking.new(booking_params)
    @booking.flight_id = @flight_id

    if @booking.save
      redirect_to root_path, notice: "Successfully booked flight \##{@flight_id}"
    else
      flash.now[:error] = 'Booking not successfull'
      render :new, status: :unprocessable_entity
    end
  end

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:id, :name, :email])
  end
end
