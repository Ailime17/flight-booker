class FlightsController < ApplicationController
  def index
    @departure_airport_options = Flight.select(:departure_airport_id).distinct.map { |f| [f.departure_airport.code, f.departure_airport.code] }
    @arrival_airport_options = Flight.select(:arrival_airport_id).distinct.map { |f| [f.arrival_airport.code, f.arrival_airport.code] }
    all_flight_dates = Flight.all.map { |f| [f.date.strftime("%d(%A)-%m-%Y"), f.date.strftime("%d-%m-%Y")] }
    @date_options = []
    all_flight_dates.each do |d|
      @date_options << d unless @date_options.include?(d)
    end
    if params.key?('flight_data')
      @matching_flights = []
      potential_matches = Flight.where(departure_airport: Airport.find_by(code: flight_params['flight_data']['departure_airport'])).where(arrival_airport: Airport.find_by(code: flight_params['flight_data']['arrival_airport']))
      potential_matches.each do |f|
        @matching_flights << f if f.date.strftime("%d-%m-%Y") == flight_params['flight_data']['date']
      end
    end
    @flight_params = flight_params
  end

  def flight_params
    params.permit(:commit, flight_data: {})
  end
end
