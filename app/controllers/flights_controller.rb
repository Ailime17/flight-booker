class FlightsController < ApplicationController
  def index
    @departure_airport_options = Flight.select(:departure_airport_id).distinct.map { |f| [f.departure_airport.code, f.departure_airport.code] }
    @arrival_airport_options = Flight.select(:arrival_airport_id).distinct.map { |f| [f.arrival_airport.code, f.arrival_airport.code] }
    @date_options = Flight.all.map { |f| [f.date.strftime("%k:%M, %d(%A)-%m-%Y"), f.date] }
  end
end
