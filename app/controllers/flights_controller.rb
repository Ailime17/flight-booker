class FlightsController < ApplicationController
  def index
    @departure_airport_options = Flight.select(:departure_airport_id).distinct.map { |f| [f.departure_airport.code, f.departure_airport.code] }
    @arrival_airport_options = Flight.select(:arrival_airport_id).distinct.map { |f| [f.arrival_airport.code, f.arrival_airport.code] }
    @date_options = Flight.all.map { |f| [f.date.strftime("%d(%A)-%m-%Y"), f.date.strftime("%d-%m-%Y")] }
    dates_array = []
    @date_options.each do |d|
      dates_array << d unless dates_array.include?(d)
    end
    @date_options = dates_array
    if params.key?('flight_data')
      flights_array = []
      @matching_flights = Flight.where(departure_airport: Airport.find_by(code: flight_params['flight_data']['departure_airport'])).where(arrival_airport: Airport.find_by(code: flight_params['flight_data']['arrival_airport']))
      @matching_flights.each do |f|
        flights_array << f if f.date.strftime("%d-%m-%Y") == flight_params['flight_data']['date']
      end
      @matching_flights = flights_array
    end
    @flight_params = flight_params
  end

  def flight_params
    params.permit(:commit, flight_data: {})
  end
end
