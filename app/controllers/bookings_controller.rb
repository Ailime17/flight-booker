class BookingsController < ApplicationController
  def new
    @flight_id = flight_params["chosen_flight_id"]
    @chosen_flight = Flight.find(@flight_id)
    @num_of_passengers = flight_params["passengers_num"].to_i

    @booking = Booking.new(flight_id: @flight_id)
    @num_of_passengers.times do
      @booking.passengers.build
    end
  end

  def create
    @flight_id = booking_params['flight_id']

    @booking = Booking.new(booking_params[:booking])
    @booking.flight_id = @flight_id

    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(booking: @booking, passenger: passenger).confirmation_email.deliver_later
      end
      redirect_to @booking, notice: "Successfully booked flight \##{@flight_id}"
    else
      flash.now[:error] = 'Booking not successfull'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.permit(:authenticity_token, :commit, :flight_id, booking: {passengers_attributes: [:id, :name, :email]})
  end

  def flight_params
    params.permit(:passengers_num, :chosen_flight_id, :commit)
  end
end
