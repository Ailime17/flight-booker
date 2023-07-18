class PassengerMailer < ApplicationMailer
  default from: email_address_with_name('example@example.com', 'HeavenlyAirlines')

  def confirmation_email
    @booking = params[:booking]
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: "Booking ##{@booking.id} confirmation")
  end
end
